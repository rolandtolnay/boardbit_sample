import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../common/extensions/build_context_ext.dart';
import '../../common/extensions/list_divider_ext.dart';
import '../../common/extensions/scroll_controller_ext.dart';
import '../../common/use_init_hook.dart';
import '../../common/widgets/app_search_input.dart';
import '../../common/widgets/button/app_gradient_icon_button.dart';
import '../../common/widgets/button/app_simple_icon_button.dart';
import '../../gen/assets.gen.dart';
import '../../translations/locale_keys.g.dart';
import '../domain/player_entity.dart';
import '../domain/player_score.dart';

enum PageDirection { backward, forward }

class PlayerScoreInputPage extends HookConsumerWidget {
  const PlayerScoreInputPage({
    super.key,
    required this.player,
    required this.score,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
    this.inputFocusNode,
    this.onScoreChanged,
    this.onPageChangeRequest,
    this.directionEnabled,
  });

  final PlayerEntity player;
  final PlayerScore? score;
  final FocusNode? inputFocusNode;

  final EdgeInsetsGeometry padding;

  final ValueChanged<PlayerScore>? onScoreChanged;
  final ValueChanged<PageDirection>? onPageChangeRequest;
  final bool Function(PageDirection)? directionEnabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputController = useTextEditingController();
    useListenable(inputController);

    final selectedPartIndex = useState<int?>(null);

    final selected = selectedPartIndex.value;
    final input = inputController.text.trim();

    _InputState makeInputState() {
      if (input.isEmpty) {
        return selected != null
            ? _InputState.deleting
            : _InputState.addingInvalid;
      }

      if (selected == null) return _InputState.adding;

      final inputMatchingSelected =
          input.trim() == score?.scoreParts[selected].toString();
      return inputMatchingSelected
          ? _InputState.updatingInvalid
          : _InputState.updating;
    }

    final inputState = makeInputState();

    final scoreParts = score?.scoreParts ?? [];
    final scrollController = useScrollController();

    // Used to figure out if we need to scroll to the end
    final lastInputState = useValueNotifier<_InputState?>(null);
    useAsyncEffect(
      () {
        // TODO(Roland): Make this better by using scroll positioned list for parts
        if (lastInputState.value?.shouldScrollToEnd ?? false) {
          scrollController.scrollToEnd();
        }
      },
      [scoreParts],
    );

    final scorePartRow = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(4),
      controller: scrollController,
      child: Row(
        children: [
          if (scoreParts.isEmpty) const SizedBox(height: 36),
          ...scoreParts.mapIndexed(
            (index, scorePart) {
              final selected = selectedPartIndex.value == index;
              final color = selected
                  ? context.color.primaryLight.withOpacity(0.1)
                  : context.color.primaryLight.withOpacity(0.7);
              final borderColor = selected ? context.color.primaryLight : color;
              final fontColor = selected
                  ? context.color.primaryLight
                  : context.color.offWhite;

              return InkWell(
                onTap: () {
                  if (selectedPartIndex.value == index) {
                    selectedPartIndex.value = null;
                    inputController.clear();
                  } else {
                    selectedPartIndex.value = index;
                    inputController.text = scorePart.toString();
                    inputFocusNode?.requestFocus();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: borderColor,
                      width: 3,
                      strokeAlign: 1,
                    ),
                    color: color,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),
                  child: Text(
                    '+$scorePart',
                    style: context.typography.titleSmall.copyWith(
                      height: 32 / 18,
                      color: fontColor,
                      fontWeight: FontWeight.w600,
                      fontFeatures: [const FontFeature.tabularFigures()],
                    ),
                  ),
                ),
              );
            },
          ).divide(const SizedBox(width: 12)),
        ],
      ),
    );

    final submitButton = AppGradientIconButton(
      icon: inputState.buildSubmitIcon(context),
      gradient: inputState.gradient(context),
      enabled: inputState.buttonEnabled,
      onPressed: () {
        final scorePart = int.tryParse(inputController.text.trim());

        final PlayerScore newScore;
        switch (inputState) {
          case _InputState.adding:
            if (scorePart == null) return;
            newScore = score?.addingScorePart(scorePart) ??
                PlayerScore(playerId: player.id, scoreParts: [scorePart]);

          case _InputState.updating:
            if (score == null || scorePart == null || selected == null) return;
            newScore = score!.copyWith(
              scoreParts: [
                ...score!.scoreParts.take(selected),
                scorePart,
                ...score!.scoreParts.skip(selected + 1),
              ],
            );

          case _InputState.deleting:
            if (score == null || selected == null) return;
            newScore = score!.copyWith(
              scoreParts: [
                ...score!.scoreParts.take(selected),
                ...score!.scoreParts.skip(selected + 1),
              ],
            );

          case _InputState.addingInvalid:
          case _InputState.updatingInvalid:
            return;
        }

        lastInputState.value = inputState;
        onScoreChanged?.call(newScore);
        selectedPartIndex.value = null;
        inputController.clear();
      },
    );

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  player.name,
                  style: context.typography.titleLarge.copyWith(
                    height: 28 / 22,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              PageDirection.backward.buildButton(
                context,
                directionEnabled: directionEnabled,
                onPageChangeRequest: onPageChangeRequest,
              ),
              const SizedBox(width: 8),
              PageDirection.forward.buildButton(
                context,
                directionEnabled: directionEnabled,
                onPageChangeRequest: onPageChangeRequest,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: scorePartRow),
              const SizedBox(width: 8),
              SizedBox(
                width: 64,
                child: Visibility(
                  visible: (score?.totalScore ?? 0) > 0,
                  child: Center(
                    child: Text(
                      '= ${score?.totalScore ?? 0}',
                      style: context.typography.titleSmall.copyWith(
                        height: 32 / 18,
                        fontWeight: FontWeight.w700,
                        fontFeatures: [const FontFeature.tabularFigures()],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: AppSearchInput(
                  controller: inputController,
                  focusNode: inputFocusNode,
                  keyboardType: TextInputType.number,
                  hasPrefixIcon: false,
                  hintText: selected != null
                      ? tr(LocaleKeys.plays_score_edit_hint)
                      : tr(LocaleKeys.plays_score_add_hint),
                  maxLength: 3,
                ),
              ),
              const SizedBox(width: 8),
              submitButton,
            ],
          ),
        ],
      ),
    );
  }
}

enum _InputState {
  adding,
  addingInvalid,
  updating,
  updatingInvalid,
  deleting;

  bool get buttonEnabled => switch (this) {
        _InputState.addingInvalid || _InputState.updatingInvalid => false,
        _ => true
      };

  Widget buildSubmitIcon(BuildContext context) {
    const size = 20.0;

    final image = switch (this) {
      _InputState.adding || _InputState.addingInvalid => Assets.icons.arrowUp,
      _InputState.updating ||
      _InputState.updatingInvalid =>
        Assets.icons.arrowTurnUp,
      _InputState.deleting => Assets.icons.arrowDown
    };
    final color = context.color.offWhite;
    return image.svg(width: size, height: size, colorFilter: color.filter);
  }

  Gradient gradient(BuildContext context) {
    final color = switch (this) {
      _InputState.adding ||
      _InputState.addingInvalid ||
      _InputState.updating ||
      _InputState.updatingInvalid =>
        context.color.primaryGradient,
      _InputState.deleting => context.color.redGradient
    };
    return color;
  }

  bool get shouldScrollToEnd =>
      switch (this) { _InputState.adding => true, _ => false };
}

extension on PageDirection {
  Widget buildButton(
    BuildContext context, {
    bool Function(PageDirection)? directionEnabled,
    ValueChanged<PageDirection>? onPageChangeRequest,
  }) {
    final enabled = directionEnabled?.call(this) ?? true;
    final iconData = switch (this) {
      PageDirection.backward => HugeIcons.strokeRoundedArrowLeft01,
      PageDirection.forward => HugeIcons.strokeRoundedArrowRight01,
    };
    final iconColor =
        enabled ? context.color.primary : context.color.primaryDisabled;
    return AppSimpleIconButton(
      icon: HugeIcon(icon: iconData, color: iconColor),
      color: Colors.transparent,
      onPressed: enabled ? () => onPageChangeRequest?.call(this) : () {},
    );
  }
}

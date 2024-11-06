import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../auth/user_provider.dart';
import '../common/extensions/async_value_ext.dart';
import '../common/extensions/build_context_ext.dart';
import '../common/haptic_provider.dart';
import '../common/use_init_hook.dart';
import '../common/widgets/app_divider.dart';
import '../common/widgets/app_list_view.dart';
import '../common/widgets/app_scaffold.dart';
import '../common/widgets/app_search_input.dart';
import '../common/widgets/app_skeletonizer.dart';
import '../common/widgets/app_snack_bar.dart';
import '../common/widgets/button/app_floating_icon_button.dart';
import '../common/widgets/button/app_large_gradient_button.dart';
import '../common/widgets/button/app_underline_button.dart';
import '../common/widgets/rounded_box.dart';
import '../game/domain/game_detail_entity.dart';
import '../game/provider/game_detail_provider.dart';
import '../root/app_tab_enum.dart';
import '../translations/locale_keys.g.dart';
import 'domain/player_entity.dart';
import 'provider/play_builder_provider.dart';
import 'provider/play_provider.dart';
import 'provider/player_list_provider.dart';
import 'provider/user_player_provider.dart';
import 'widgets/play_list_tile.dart';
import 'widgets/player_picker_item.dart';

class PlayPlayerPickerPage extends HookConsumerWidget {
  const PlayPlayerPickerPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (_) => const PlayPlayerPickerPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final builder = ref.watch(playBuilderProvider);

    final userPlayer = ref.watch(userPlayerProvider).valueOrNull;
    useInitAsync(() {
      if (userPlayer != null) {
        ref.read(playBuilderProvider.notifier).addPlayer(userPlayer);
      }
    });

    final gameDetailState = ref.watch(
      gameDetailProvider(builder.game?.bggId ?? ''),
    );

    final playerListState = ref.watch(playerListProvider);
    final playerList = playerListState.valueOrNull ?? [];

    final inputController = useTextEditingController();
    useListenable(inputController);

    final items = makeItems(ref, playerList, inputController.text);
    final playerListView = AppListView(
      items: items,
      itemBuilder: (c, item, index) => switch (item) {
        PlayerPickerPlayerItem() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: RoundedBox(
              onTap: () {
                final notifier = ref.read(playBuilderProvider.notifier);
                if (item.isAdded) {
                  notifier.removePlayer(item.player);
                } else {
                  notifier.addPlayer(item.player);
                }
              },
              borderColor: item.boxBorderColor(context),
              child: Row(
                children: [
                  item.buildLeadingIcon(context),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      item.player.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.typography.subtitleSmall.copyWith(
                        fontWeight:
                            item.isAdded ? FontWeight.w700 : FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  item.buildTrailingIcon(context),
                ],
              ),
            ),
          ),
        PlayerPickerAddPlayerItem() => Padding(
            padding: const EdgeInsets.all(24),
            child: Align(
              child: AppUnderlineButton(
                title: tr(LocaleKeys.plays_add_player_x, args: [item.name]),
                onPressed: () async {
                  final player = await ref
                      .read(playerListProvider.notifier)
                      .addPlayer(name: item.name);

                  ref.read(playBuilderProvider.notifier).addPlayer(player);
                  inputController.clear();
                },
              ),
            ),
          ),
        PlayerPickerHintItem() => Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              tr(LocaleKeys.plays_add_player_hint),
              style: context.typography.labelSmall,
              textAlign: TextAlign.center,
            ),
          )
      },
    );

    ref.listen(playProvider, (_, next) {
      next.whenOrNull(
        error: (e, _) => AppSnackBar.show(context, title: e.toString()),
      );
    });

    final saveButton = AppLargeGradientButton(
      title: tr(LocaleKeys.common_save),
      loading: ref.watch(playProvider).isLoading,
      enabled: gameDetailState.hasValue,
      onPressed: () async {
        final game = gameDetailState.valueOrNull;
        if (game == null) return;

        final userId = ref.read(userProvider)?.id ?? '';
        final entity = builder.makeEntity(game: game, createdBy: userId);
        if (entity == null) return;

        await ref.read(playProvider.notifier).savePlay(entity);

        ref.read(appTabProvider.notifier).state = AppTab.plays;

        final playState = ref.read(playProvider);
        if (!context.mounted || playState.hasError) return;
        Navigator.of(context).popUntil((r) => r.isFirst);
      },
    );

    return AppScaffold(
      trailing: FloatingCloseButton(
        onPressed: () {
          ref.feedbackLight();
          Navigator.of(context).popUntil((r) => r.isFirst);
        },
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          gameDetailState.whenDataNotNull(
            (game) => PlayListTile(game: game, playDate: builder.date),
            orElse: (_) => AppSkeletonizer(
              child: PlayListTile(
                game: GameDetailEntity.stub(name: builder.game?.name),
                playDate: builder.date,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            tr(LocaleKeys.plays_player_picker_headline),
            style: context.typography.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          AppSearchInput(
            controller: inputController,
            hasPrefixIcon: false,
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 16),
          Expanded(child: playerListView),
          const AppDividerShadow(shadowBottom: false, height: 0),
          const SizedBox(height: 16),
          Align(child: saveButton),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  List<PlayerPickerItem> makeItems(
    WidgetRef ref,
    Iterable<PlayerEntity> players,
    String input,
  ) {
    final builder = ref.watch(playBuilderProvider);

    final items = <PlayerPickerItem>[];

    final filteredPlayers = players.where((e) => e.name.contains(input));
    for (final player in filteredPlayers) {
      items.add(
        PlayerPickerPlayerItem(
          player,
          isAdded: builder.playerList.contains(player),
        ),
      );
    }

    final playerNames = players.map((e) => e.name).toList();
    if (input.isNotEmpty && !playerNames.contains(input)) {
      items.add(PlayerPickerAddPlayerItem(input));
    }

    if (input.isEmpty) items.add(PlayerPickerHintItem());

    return items;
  }
}

extension on PlayerPickerPlayerItem {
  Color? boxBorderColor(BuildContext context) {
    return isAdded ? context.color.primary : null;
  }

  Widget buildLeadingIcon(BuildContext context) {
    const size = 18.0;

    final color = isAdded ? context.color.iconColor : context.color.neutral600;
    return HugeIcon(
      icon: HugeIcons.strokeRoundedUser,
      color: color,
      size: size,
    );
  }

  Widget buildTrailingIcon(BuildContext context) {
    return isAdded
        ? HugeIcon(
            icon: HugeIcons.strokeRoundedTick01,
            color: context.color.primary,
          )
        : HugeIcon(
            icon: HugeIcons.strokeRoundedAdd01,
            color: context.color.neutral600,
          );
  }
}

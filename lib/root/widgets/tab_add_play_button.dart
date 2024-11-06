import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/decorated_tappable.dart';
import '../../common/extensions/build_context_ext.dart';
import '../../common/haptic_provider.dart';
import '../../common/theme/color.dart';
import '../../gen/assets.gen.dart';
import '../../play/play_game_picker_page.dart';

class TabAddPlayButton extends ConsumerWidget {
  const TabAddPlayButton({super.key, this.elevation = 0});

  final double elevation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const size = 56.0;
    return DecoratedTappable(
      onTap: () {
        ref.feedbackLight();
        Navigator.of(context).push(PlayGamePickerPage.route());
      },
      width: size,
      height: size,
      elevation: elevation,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size),
        gradient: context.color.primaryGradient,
        boxShadow: const [
          BoxShadow(
            color: kShadowColor,
            offset: Offset(2, 3),
            blurRadius: 26,
          ),
        ],
      ),
      child: Center(
        child: Assets.icons.add.svg(
          width: 24,
          height: 24,
          colorFilter: context.color.offWhite.filter,
        ),
      ),
    );
  }
}

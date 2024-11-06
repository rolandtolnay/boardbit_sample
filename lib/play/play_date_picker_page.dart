import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/extensions/async_value_ext.dart';
import '../common/extensions/build_context_ext.dart';
import '../common/extensions/date_time_ext.dart';
import '../common/haptic_provider.dart';
import '../common/widgets/app_scaffold.dart';
import '../common/widgets/app_skeletonizer.dart';
import '../common/widgets/button/app_floating_icon_button.dart';
import '../common/widgets/button/app_large_gradient_button.dart';
import '../game/domain/game_detail_entity.dart';
import '../game/provider/game_detail_provider.dart';
import '../translations/locale_keys.g.dart';
import 'play_player_picker_page.dart';
import 'provider/play_builder_provider.dart';
import 'widgets/play_list_tile.dart';

class PlayDatePickerPage extends HookConsumerWidget {
  const PlayDatePickerPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (_) => const PlayDatePickerPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final builder = ref.watch(playBuilderProvider);
    final date = builder.date;

    final gameDetail = ref.watch(gameDetailProvider(builder.game?.bggId ?? ''));

    return AppScaffold(
      resizeToAvoidBottomInset: false,
      trailing: FloatingCloseButton(
        onPressed: () {
          ref.feedbackLight();
          Navigator.of(context).popUntil((r) => r.isFirst);
        },
      ),
      // TODO(Roland): Make this scrollable for smaller screens with Slivers
      body: Column(
        children: [
          gameDetail.whenDataNotNull(
            (game) => PlayListTile(game: game),
            orElse: (_) => AppSkeletonizer(
              child: PlayListTile(
                game: GameDetailEntity.stub(name: builder.game?.name),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            tr(LocaleKeys.plays_date_picker_headline),
            style: context.typography.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              firstDayOfWeek: 1,
              lastDate: DateTime.now().startOfDay,
            ),
            value: date != null ? [date] : [],
            onValueChanged: (dates) =>
                ref.read(playBuilderProvider.notifier).setDate(dates.first),
          ),
          const Spacer(),
          AppLargeGradientButton(
            title: tr(LocaleKeys.common_continue),
            onPressed: () => Navigator.of(context).push(
              PlayPlayerPickerPage.route(),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../common/extensions/build_context_ext.dart';
import '../../common/widgets/rounded_box.dart';
import '../../translations/locale_keys.g.dart';
import '../domain/play_entity.dart';

final _kWeekdayFormat = DateFormat('EEEE');

final _kDayDateFormat = DateFormat('MMMM d, yyyy');

class PlayDetailDateWidget extends StatelessWidget {
  const PlayDetailDateWidget({super.key, required this.play});

  final PlayEntity play;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          tr(LocaleKeys.plays_detail_date),
          style: context.typography.titleSmall.copyWith(height: 28 / 18),
        ),
        const SizedBox(height: 12),
        RoundedBox(
          child: Row(
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedCalendar03,
                color: context.color.neutral600,
                size: 18,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      _kDayDateFormat.format(play.playDate),
                      style: context.typography.bodyMedium.copyWith(
                        color: context.color.iconColor,
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: true,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _kWeekdayFormat.format(play.playDate),
                      style: context.typography.bodyMedium,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

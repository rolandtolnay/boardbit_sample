import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../auth/auth_widget.dart';
import 'app_theme.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BoardBit',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: context.appTheme,
      home: const AuthWidget(),
    );
  }
}

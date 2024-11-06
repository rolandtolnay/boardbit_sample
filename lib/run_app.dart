import 'dart:async';
import 'dart:developer' as dev;

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/data/crashlytics.dart';
import 'common/data/init_logging.dart';
import 'common/provider_failure_observer.dart';
import 'flavor_config.dart';
import 'root/application.dart';
import 'storage/shared_preferences_provider.dart';
import 'translations/codegen_loader.g.dart';

Future<void> runBoardBitApp(FlavorConfig flavorConfig) async {
  FirebaseCrashlytics? crashlytics;

  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    try {
      await Firebase.initializeApp(options: flavorConfig.firebaseOptions);

      if (!kIsWeb) crashlytics = FirebaseCrashlytics.instance;
    } catch (e) {
      debugPrint("Firebase couldn't be initialized: $e");
    }

    initLogging(crashlytics);
    await enableCrashCollection(crashlytics);

    await guardedMain(flavorConfig);
  }, (e, st) {
    if (kIsWeb) {
      debugPrint('[ERROR] $e');
    } else {
      dev.log('\x1B[31m[ERROR] $e\x1B[0m', error: e, stackTrace: st);
      crashlytics?.recordError(e, st, fatal: true);
    }
    debugPrintStack(stackTrace: st);
  });
}

Future<void> guardedMain(FlavorConfig flavorConfig) async {
  await initializeDateFormatting();
  await EasyLocalization.ensureInitialized();

  final sharedPref = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    observers: [
      ProviderFailureObserver(),
    ],
    overrides: <Override>[
      sharedPreferencesProvider.overrideWithValue(sharedPref),
      flavorConfigProvider.overrideWithValue(flavorConfig),
    ],
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'lib/translations',
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('en', 'GB'),
      useOnlyLangCode: true,
      child: UncontrolledProviderScope(
        container: container,
        child: const Application(),
      ),
    ),
  );
}

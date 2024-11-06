import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AppFlavor { prod, dev }

class FlavorConfig {
  final AppFlavor flavor;
  final String bundleId;
  final FirebaseOptions firebaseOptions;

  FlavorConfig({
    required this.flavor,
    required this.bundleId,
    required this.firebaseOptions,
  });

  bool get isDev => flavor == AppFlavor.dev;

  bool get isProd => flavor == AppFlavor.prod;
}

final flavorConfigProvider = Provider<FlavorConfig>(
  (_) {
    throw Exception('FlavorConfig should be overridden in main.dart');
  },
);

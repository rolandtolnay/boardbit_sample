import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../storage/shared_preferences_provider.dart';

final hapticProvider = ChangeNotifierProvider.autoDispose<HapticProvider>(
  (ref) => HapticProvider(ref.watch(sharedPreferencesProvider)),
);

enum HapticType { selection, light, medium }

class HapticProvider extends ChangeNotifier {
  static const key = 'storage_haptic_effects';

  final SharedPreferences _prefs;

  HapticProvider(this._prefs);

  bool get hapticsEnabled => _prefs.getBool(key) ?? true;

  void setHapticsEnabled({required bool isOn}) {
    _prefs.setBool(key, isOn);
    notifyListeners();
  }

  void feedback(HapticType haptic) {
    if (!hapticsEnabled) return;

    switch (haptic) {
      case HapticType.selection:
        HapticFeedback.selectionClick();
      case HapticType.light:
        HapticFeedback.lightImpact();
      case HapticType.medium:
        HapticFeedback.mediumImpact();
    }
  }
}

extension HapticConvenience on WidgetRef {
  void feedbackSelection() =>
      read(hapticProvider).feedback(HapticType.selection);

  void feedbackLight() => read(hapticProvider).feedback(HapticType.light);
}

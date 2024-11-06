import 'package:flutter/material.dart';

class AppSnackBar extends SnackBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
    BuildContext context, {
    required String title,
  }) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(AppSnackBar(title: title));
  }

  AppSnackBar({super.key, required String title})
      : super(
          behavior: SnackBarBehavior.floating,
          content: Text(title),
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
}

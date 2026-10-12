import 'dart:ui';

import 'package:flutter/material.dart';

/// The language and theme the visitor picked: Arabic first, in the device's theme.
class LandingSettings extends ChangeNotifier {
  LandingSettings()
    : _dark = PlatformDispatcher.instance.platformBrightness == Brightness.dark;

  bool _arabic = true;
  bool _dark;

  bool get arabic => _arabic;
  bool get dark => _dark;

  void toggleLanguage() {
    _arabic = !_arabic;
    notifyListeners();
  }

  void toggleTheme() {
    _dark = !_dark;
    notifyListeners();
  }

  static LandingSettings of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<LandingSettingsScope>()!.notifier!;
}

class LandingSettingsScope extends InheritedNotifier<LandingSettings> {
  const LandingSettingsScope({super.key, required super.notifier, required super.child});
}

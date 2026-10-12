import 'package:flutter/material.dart';

import 'landing_settings.dart';

/// Every text of the page, in Arabic and English.
class LandingStrings {
  const LandingStrings._(this._arabic);

  final bool _arabic;

  static LandingStrings of(BuildContext context) =>
      LandingStrings._(LandingSettings.of(context).arabic);

  String _t(String ar, String en) => _arabic ? ar : en;

  String get headline => _t('رفيقك اليومي إلى الله', 'Your daily companion to Allah');
  String get description => _t(
    'كل ما يعينك على يومك مع الله، في تطبيق واحد.',
    'Everything that helps your day with Allah, in one app.',
  );
  String get featureMushaf => _t('المصحف والتفسير', 'Quran & Tafsir');
  String get featureTasmee => _t('تسميع القرآن', 'Recitation check');
  String get featurePrayer => _t('مواقيت الصلاة والأذان', 'Prayer times & Adhan');
  String get featureAdhkar => _t('الأذكار والتسبيح', 'Adhkar & Tasbeeh');
  String get featureCompanions => _t('خطط مع أصحابك', 'Plans with friends');
  String get downloadNow => _t('حمّل الآن', 'Download now');
  String get forAndroid => _t('لأجهزة أندرويد', 'for Android');
  String get comingSoon => _t('قريبًا', 'Coming soon');
  String get onIphone => _t('على الآيفون', 'on iPhone');
  String get appName => _t('مآب', 'Maab');
  String get otherLanguage => _t('EN', 'ع');
}

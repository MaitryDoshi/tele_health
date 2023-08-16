import 'package:tele_health/screens/core/core_export.dart';

class AppConstants {
  static const String APP_NAME = 'Repair';
  static const double APP_VERSION = 1.1;
  static const String THEME = 'demand_theme';
  static const String COUNTRY_CODE = 'demand_country_code';
  static const String LANGUAGE_CODE = 'demand_language_code';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.us,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: Images.arabicTwo,
        languageName: 'عربى',
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
  static const double limitOfPickedImageSizeInMB = 2;
}
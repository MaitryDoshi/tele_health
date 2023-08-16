class Images {
  static String get logo => 'logo'.png;
  static String get us => 'us'.png;
  static String get arabicTwo => 'arabic_two'.png;
  static String get languageIcon => 'language_icon'.png;
  static String get language => 'language'.png;
  static String get translate => 'select_language'.png;
  static String get selectedLanguage=> 'selected_language'.png;
  static String get backgroundImage=> 'background_image'.png;
  static String get hospitalHomeIcon=> 'hospital'.png;
  static String get moreIcon=> 'app'.png;
  static String get patientRecordIcon=> 'patient'.png;
  static String get appointmentIcon=> 'medical'.png;
}

extension on String {
  String get png => 'assets/images/$this.png';
}
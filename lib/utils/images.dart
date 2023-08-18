class Images {
  static String get logo => 'logo'.png;
  static String get us => 'us'.png;
  static String get arabicTwo => 'arabic_two'.png;
  static String get contact => 'contact'.png;
  static String get info => 'info'.png;
  static String get media => 'media'.png;
  static String get privacy => 'privacy'.png;
  static String get terms => 't&c'.png;
  static String get language => 'language'.png;
  static String get profile => 'profile'.png;
  static String get signIn => 'signIn'.png;
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
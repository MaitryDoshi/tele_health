import 'package:get/get.dart';
import 'package:tele_health/screens/core/core_export.dart';

class Messages extends Translations {
  final Map<String, Map<String, String>>? languages;
  Messages({@required this.languages});

  @override
  Map<String, Map<String, String>> get keys {
    return languages!;
  }
}
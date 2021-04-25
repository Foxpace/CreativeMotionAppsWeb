import 'package:creative_motion_app/resources/R.dart';

/// programming languages and their associated images
class ProgrammingLanguages{
  /// kotlin
  static const String kotlin = 'k';
  /// python
  static const String python = 'p';
  /// java
  static const String java = 'j';
  /// c
  static const String c = 'c';

  /// programming languages mapping
  static const Map<String, String> languages = <String, String>{
    kotlin: R.resource_image_kotlin,
    python: R.resource_image_python,
    java: R.resource_image_java,
    c: R.resource_image_c
  };

}
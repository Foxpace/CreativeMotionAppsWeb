import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/programming_languages.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:creative_motion_app/widgets/views/buttons.dart';
import 'package:flutter/material.dart';

/// [LibsContent] shows column of libs with descriptions, features and links
/// carrier of the main information for the Library Widget
class LibsContent {
  /// signal screen implementation - deep learning explanation
  LibsContent.signalScreen()
      : title = Strings.kotlin_ecg_detectors_title,
        subtitle = Strings.kotlin_ecg_detectors_subtitle,
        description = Strings.kotlin_ecg_detectors_description,
        features = Strings.kotlin_ecg_detectors_features,
        programmingLanguage = Image.asset(
            ProgrammingLanguages.languages[ProgrammingLanguages.kotlin]!),
        color = CustomColors.kotlin_orange,
        image = null,
        navButtonsIcons = <NavigationIcon>[
          const NavigationIcon(
              Strings.about_github,
              R.resource_image_github_large,
              R.url_github_kotlin_ecg_detectors,
              null)
        ];

  /// C++ implementation R wave detection
  LibsContent.cppEcgDetectors()
      : title = Strings.c_ecg_detectors_title,
        subtitle = Strings.c_ecg_detectors_subtitle,
        description = Strings.c_ecg_detectors_description,
        features = Strings.c_ecg_detectors_features,
        programmingLanguage = Image.asset(
            ProgrammingLanguages.languages[ProgrammingLanguages.c]!),
        color = CustomColors.c_brown,
        image = null,
        navButtonsIcons = <NavigationIcon>[
          const NavigationIcon(
              Strings.about_github,
              R.resource_image_github_large,
              R.url_github_cpp_ecg_detectors,
              null)
        ];

  /// kotlin R wave detection
  LibsContent.kotlinEcgDetectors()
      : title = Strings.signal_screen_title,
        subtitle = Strings.signal_screen_subtitle,
        description = Strings.signal_screen_description,
        features = Strings.signal_screen_features,
        programmingLanguage = Image.asset(
            ProgrammingLanguages.languages[ProgrammingLanguages.python]!),
        color = CustomColors.python_blue,
        image = null,
        //  Image.asset(R.resource_image_ecg_gradient),
        navButtonsIcons = <NavigationIcon>[
          const NavigationIcon(Strings.about_github,
              R.resource_image_github_large, R.url_github_signal_screen, null)
        ];

  /// title of the lib (left side - top)
  final String title;

  /// subtitle for the lib (left side - above description)
  final String subtitle;

  /// description of the lib (left side)
  final String description;

  /// main features of the lib (right side)
  final String features;

  /// used languages (right - top with buttons)
  final Image programmingLanguage;

  /// color of the language - not used
  final Color color;

  /// image for the library - not used
  final Image? image;

  /// navigation buttons (top right)
  final List<NavigationIcon> navButtonsIcons;

  /// aggregation of the libraries
  static final List<LibsContent> libs = <LibsContent>[
    LibsContent.cppEcgDetectors(),
    LibsContent.kotlinEcgDetectors(),
    LibsContent.signalScreen(),
  ];

  /// number of created libraries
  static int getLength() {
    return libs.length;
  }
}

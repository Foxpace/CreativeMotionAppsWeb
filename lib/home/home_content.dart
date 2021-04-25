import 'package:creative_motion_app/home/home_app_widget.dart';
import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/programming_languages.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:creative_motion_app/widgets/views/buttons.dart';
import 'package:creative_motion_app/widgets/views/custom_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// carrier of the content about the phone app
class AppContent {
  /// SensorBox implementation
  AppContent.sensorBox(Function? navigationCallback)
      : title = Strings.sensorbox_title,
        color = CustomColors.blue,
        appImage = R.resource_image_sensorbox,
        comment = Strings.sensorbox_comment,
        date = Strings.sensorbox_date,
        languages = <String>[ProgrammingLanguages.kotlin],
        navButtonIcons = <NavigationIcon>[
          NavigationIcon(Strings.about_app, R.resource_image_android_large,
              R.paths_sensorbox, navigationCallback),
          const NavigationIcon(
              Strings.about_google_play,
              R.resource_image_google_play_large,
              R.url_google_play_sensorbox,
              null),
          const NavigationIcon(Strings.about_github,
              R.resource_image_github_large, R.url_github_sensorbox, null),
        ];

  /// BeSafeBox implementation
  AppContent.beSafeBox(Function? navigationCallback)
      : title = Strings.besafebox_title,
        color = CustomColors.softened_grey,
        appImage = R.resource_image_besafebox,
        comment = Strings.besafebox_comment,
        date = Strings.besafebox_date,
        languages = <String>[
          ProgrammingLanguages.java,
          ProgrammingLanguages.c,
          ProgrammingLanguages.kotlin,
          ProgrammingLanguages.python
        ],
        navButtonIcons = <NavigationIcon>[
          NavigationIcon(Strings.about_app, R.resource_image_android_large,
              R.paths_besafebox_app, navigationCallback),
          NavigationIcon(
              Strings.about_research,
              R.resource_image_research_large,
              R.paths_besafebox_science,
              navigationCallback),
          const NavigationIcon(Strings.about_github,
              R.resource_image_github_large, R.url_github_besafebox_app, null),
        ];

  /// ECG biometry
  AppContent.ecgBiometry(Function? navigationCallback)
      : title = Strings.ecg_biometry_title,
        color = CustomColors.pale_violet_red,
        appImage = R.resource_image_ecgbiometrics,
        comment = Strings.ecg_biometry_comment,
        date = Strings.ecg_biometry_date,
        languages = <String>[
          ProgrammingLanguages.kotlin,
          ProgrammingLanguages.python
        ],
        navButtonIcons = <NavigationIcon>[
          NavigationIcon(
              Strings.about_research,
              R.resource_image_research_large,
              R.paths_ecg_biometrics_science,
              navigationCallback),
        ];

  /// [title] main title of the left of the page
  final String title;

  /// [color] background color
  final Color color;

  /// [appImage] - main image to represent in view
  final String appImage;

  /// [comment] - subtitle for the app
  final String comment;

  /// [date] - date of the active development
  final String date;

  /// [languages] used in the project
  final List<String> languages;

  /// [navButtonIcons] - buttons to change page
  final List<NavigationIcon> navButtonIcons;

  /// list with the all apps
  static final List<AppContent> apps = <AppContent>[
    AppContent.beSafeBox(null),
    AppContent.ecgBiometry(null),
    AppContent.sensorBox(null),
  ];

  /// number of implemented apps
  static int getLength() {
    return apps.length;
  }

  /// legit way of getting tabs with functional buttons
  static List<AppWidget> getTabs(Function navigationCallback) {
    final List<AppContent> apps = <AppContent>[
      AppContent.beSafeBox(navigationCallback),
      AppContent.ecgBiometry(navigationCallback),
      AppContent.sensorBox(navigationCallback),
    ];

    return apps.map((AppContent tab) => AppWidget(tab)).toList();
  }

  /// [getTabView] returns [TabBarView] with all the apps and bar on top
  static Widget getTabView(
          {required BuildContext context,
          required Color selectedWidget,
          required Color unselectedWidget,
          required Color textColor,
          required Color backgroundColor,
          bool? scrollable,
          required SizingInformation sizingInformation,
          required Function navigationCallback}) =>
      DefaultTabController(
        length: AppContent.getLength(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Scaffold(
            appBar: ColoredTabBar(
                backgroundColor,
                TabBar(
                  isScrollable: scrollable ?? false,
                  labelColor: selectedWidget,
                  indicatorColor: selectedWidget,
                  unselectedLabelColor: unselectedWidget,
                  tabs: AppContent.apps
                      .map((AppContent app) => Tab(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(app.title,
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 20, color: textColor)),
                          )))
                      .toList(),
                )),
            body: TabBarView(
              children: AppContent.getTabs(navigationCallback),
            ),
          ),
        ),
      );
}

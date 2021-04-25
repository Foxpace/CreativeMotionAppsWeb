import 'package:creative_motion_app/home/home_content.dart';
import 'package:creative_motion_app/navigation/url_navigator.dart';
import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [Home] main page of the creative motion apps
class Home extends StatelessWidget {
  /// callback for the sites changing
  Home(this._navigationCallBack);

  final void Function(BuildContext buildContext, String page)
      _navigationCallBack;

  /// colors to implement in homepage
  final Color textColor = CustomColors.white;

  /// for tabbar for selected item
  final Color selectedWidget = CustomColors.white;

  /// for tabbar for unselected item
  final Color unselectedWidget = Colors.white24;

  /// header background color
  final Color backgroundColor = CustomColors.blue;

  /// header text color
  final Color textButtonColor = CustomColors.blue;

  /// header button colors
  final Color buttonColor = CustomColors.white;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          getContent(context, sizingInformation));

  /// one [RawScrollbar] to scroll through the column
  Widget getContent(
          BuildContext context, SizingInformation sizingInformation) =>
      Scaffold(
          body: RawScrollbar(
        thumbColor: Colors.white70,
        isAlwaysShown: true,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[getTopInfo(context), getScrollingApps()],
        )),
      ));

  /// places tabs into one scrollview
  Widget getScrollingApps() => ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: AppContent.getTabs(_navigationCallBack),
      );

  ///  generates side panel for main page - for phone version
  Widget getTopInfo(BuildContext context) => Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 36, 0, 36),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: getMainTextInfo(context)),
        ),
      );

  /// content for the introduction of the main page
  List<Widget> getMainTextInfo(BuildContext context) => <Widget>[
        Image.asset(
          R.resource_image_header,
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        ...getButtonsAndMail(context)
      ];

  /// buttons and mail text for the header
  List<Widget> getButtonsAndMail(BuildContext context) => <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              // libraries
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () => _navigationCallBack(context, R.paths_libs),
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(R.resource_image_lib_blue),
                  ),
                  label: Text(
                    Strings.main_libraries,
                    style: TextStyle(
                        color: textButtonColor, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(primary: buttonColor),
                ),
              ),

              // about page
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () => _navigationCallBack(context, R.paths_bio),
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(R.resource_image_about),
                  ),
                  label: Text(
                    Strings.main_bio,
                    style: TextStyle(
                        color: textButtonColor, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(primary: buttonColor),
                ),
              ),
              // repository
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () => WebUrlDelegate.launchURL(
                      R.url_github_creative_motion_web),
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(R.resource_image_flutter_blue),
                  ),
                  label: Text(
                    Strings.creative_motion_apps_github,
                    style: TextStyle(
                        color: textButtonColor, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(primary: buttonColor),
                ),
              ),
              // licenses
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () => <void>{
                    showAboutDialog(
                        context: context,
                        applicationName: Strings.creative_motion_apps_title,
                        applicationVersion:
                            Strings.creative_motion_apps_version,
                        applicationIcon:
                            Image.asset(R.resource_image_header_icon),
                        applicationLegalese:
                            Strings.creative_motion_apps_license,
                        children: Strings.creative_motion_licenses
                            .map((String e) => Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SelectableText(
                                    e,
                                    style: const TextStyle(
                                        color: CustomColors.grey, fontSize: 14),
                                  ),
                                )))
                            .toList())
                  },
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(R.resource_image_licenses),
                  ),
                  label: Text(
                    Strings.creative_motion_apps_resources,
                    style: TextStyle(
                        color: textButtonColor, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(primary: buttonColor),
                ),
              ),
            ],
          ),
        ),

        // title text for the mail
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            Strings.main_contact,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: textColor, fontSize: 15),
          )),
        ),

        // mail text
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(
              Strings.main_mail_support,
              style: TextStyle(
                  color: textColor, fontSize: 15, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ];
}

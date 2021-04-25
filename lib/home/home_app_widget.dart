import 'package:creative_motion_app/home/home_content.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/programming_languages.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [AppWidget] creates widget to showcase the Android app
class AppWidget extends StatelessWidget {
  /// [AppWidget] constructor with custom info holder [AppContent]
  const AppWidget(this._tab);

  /// [AppContent] custom object to hold all info
  final AppContent _tab;

  final Color _textColor = CustomColors.white;
  final double _textSize = 35;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          sizingInformation.isMobile
              ? getPhoneVersion(context, sizingInformation)
              : getDesktopVersion(context, sizingInformation));

  /// App widget main view with basic info in header, image of the app and
  /// buttons for another pages
  Container getDesktopVersion(
          BuildContext context, SizingInformation sizingInformation) =>
      Container(
        padding: EdgeInsets.fromLTRB(sizingInformation.isMobile ? 25 : 75, 50,
            sizingInformation.isMobile ? 25 : 75, 50),
        height: MediaQuery.of(context).copyWith().size.height,
        color: _tab.color,
        child: Column(
          children: <Widget>[
            // row with the name, time and motto of the app
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              _tab.title,
                              style: TextStyle(
                                  color: _textColor,
                                  fontSize: _textSize,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
                  Expanded(
                      child: Align(
                        child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              _tab.date,
                              style: TextStyle(
                                color: _textColor,
                                fontSize: _textSize * 0.5,
                              ),
                            )),
                      )),
                  Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              _tab.comment,
                              style: TextStyle(
                                  color: _textColor, fontSize: _textSize),
                            )),
                      ))
                ],
              ),
            ),

            // image of the app
            Expanded(
              flex: 8,
              child: Image.asset(_tab.appImage),
            ),

            // links to sites + icons of used languages
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: sizingInformation.isTablet ? 4 : 1,
                    child: Wrap(
                      children: _tab.navButtonIcons,
                    ),
                  ),
                  Expanded(
                      flex: sizingInformation.isTablet ? 5 : 1,
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        children: _tab.languages
                            .map((String language) => Padding(
                                  padding: EdgeInsets.all(
                                      sizingInformation.isMobile ? 8 : 16),
                                  child: Image.asset(ProgrammingLanguages
                                      .languages[language]!),
                                ))
                            .toList(),
                      )),
                ],
              ),
            ),
          ],
        ),
      );

  ///the same as [getDesktopVersion], but for the phone
  Container getPhoneVersion(
          BuildContext context, SizingInformation sizingInformation) =>
      Container(
        height: MediaQuery.of(context).copyWith().size.height,
        color: _tab.color,
        padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              _tab.title,
                              style: TextStyle(
                                  color: _textColor,
                                  fontSize: _textSize,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            _tab.comment,
                            style: TextStyle(
                                color: _textColor, fontSize: _textSize * 0.5),
                          )),
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          _tab.date,
                          style: TextStyle(
                            color: _textColor,
                            fontSize: _textSize * 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Image.asset(_tab.appImage),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: _tab.navButtonIcons,
                    ),
                  ),
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: _tab.languages
                          .map((String language) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    ProgrammingLanguages.languages[language]!),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

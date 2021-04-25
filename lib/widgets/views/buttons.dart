import 'package:creative_motion_app/navigation/url_navigator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore_for_file: document

/// [NavigationButton] is implementation of OutLinedButton with custom look
/// and reproducible constructor
class NavigationButton extends StatelessWidget {
  /// default contructor
  const NavigationButton(
      {required this.text,
      required this.icon,
      required this.url,
      required this.internal,
      Color? textColor,
      Color? backgroundColor,
      Color? borderColor})
      : backgroundColor = backgroundColor ?? Colors.transparent,
        textColor = textColor ?? Colors.white,
        borderColor = borderColor ?? Colors.white;

  /// coloured button
  const NavigationButton.coloured(
      {required this.text,
      required this.url,
      required this.icon,
      this.internal,
      this.backgroundColor,
      this.textColor,
      this.borderColor});

  /// url to open
  final String url;

  /// text for button
  final String text;

  /// icon to add
  final String icon;

  /// if to use callback of our web
  final Function? internal;

  /// background color
  final Color? backgroundColor;

  /// text color
  final Color? textColor;

  /// border color
  final Color? borderColor;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton.icon(
            onPressed: () => _launchTab(context, url),
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
              child: Image.asset(icon),
            ),
            label: Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
              child:
                  Text(text, style: TextStyle(color: textColor, fontSize: 16)),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: backgroundColor,
              side: BorderSide(width: 2, color: borderColor!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
        ),
      );

  /// [_launchTab] uses internal callback to init new page of the website
  /// or it redirects you to new external site on new tab
  Future<void> _launchTab(BuildContext context, String url) async {
    if (internal == null) {
      WebUrlDelegate.launchURL(url);
    } else {
      internal!(context, url);
    }
  }
}

/// same implementation as in [NavigationButton], but the button is represented
/// by only IconButton
class NavigationIcon extends NavigationButton {
  /// default constructor
  const NavigationIcon(String text, String icon, String url, Function? internal)
      : super(text: text, icon: icon, url: url, internal: internal);

  @override
  Widget build(BuildContext buildContext) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          IconButton(
            padding: EdgeInsets.all(sizingInformation.isMobile ? 8 : 16),
            constraints: const BoxConstraints(minHeight: 16, minWidth: 16),
            iconSize: 36,
            icon: Image.asset(icon),
            tooltip: text,
            highlightColor: Colors.white,
            onPressed: () {
              _launchTab(buildContext, url);
            },
          ));
}

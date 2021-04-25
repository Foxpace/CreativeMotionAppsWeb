import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// page is created with [Wrap] for the widgets and title as header
/// can fit multiple cards / widgets with correct behaviour for the different dimensions
class WrapperPage extends StatelessWidget {
  /// default constructor
  const WrapperPage(
      {required this.colorBackground,
      required this.colorText,
      required this.title,
      required this.widgets,
      double? textSize})
      : textSize = textSize ?? 50;

  /// background color
  final Color colorBackground;

  /// text color
  final Color colorText;

  /// title of the page
  final String title;

  /// text size
  final double textSize;

  /// widgets to add for wrapper
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          Container(
              color: colorBackground,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Align(
                  child: Column(
                    children: <Widget>[
                      // title
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextWidget(
                            text: title,
                            size: textSize,
                            color: colorText,
                            textAlign: TextAlign.center,
                            bold: true,
                            maxLines: 1),
                      ),
                      // all widgets
                      if (sizingInformation.isDesktop)
                        Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            children: widgets)
                      else
                        Column(
                          children: widgets,
                        ),
                    ],
                  ),
                ),
              )));
}

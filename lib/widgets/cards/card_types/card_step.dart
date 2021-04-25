import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// card with number index as logo
class CardStep extends StatelessWidget {
  /// required index of the card - external counter
  const CardStep(
      {required this.index,
      required this.title,
      required this.description,
      Color? colorBackground,
      Color? colorText,
      double? textSize})
      : colorBackground = colorBackground ?? Colors.redAccent,
        colorText = colorText ?? Colors.white,
        textSize = textSize ?? 18;

  /// number to show
  final int index;

  /// size of the texts
  final double textSize;

  /// title of the card
  final String title;

  /// description under the title
  final String description;

  /// color background
  final Color colorBackground;

  /// color of the text
  final Color colorText;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          Padding(
            padding: sizingInformation.isMobile
                ? const EdgeInsets.fromLTRB(10, 10, 30, 10)
                : const EdgeInsets.all(20.0),
            child: SizedBox(
              height: sizingInformation.isMobile
                  ? 300
                  : sizingInformation.isTablet
                      ? 225
                      : 225,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: colorBackground,
                elevation: 10,
                child: Row(
                  children: <Widget>[
                    // number of the row
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: SizedBox(
                          child: Center(
                              child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                                color: colorText,
                                fontSize: textSize * 4,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: sizingInformation.isMobile ? 4 : 6,
                      child: Column(
                        children: <Widget>[
                          // title
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                            child: Text(
                              title,
                              style: TextStyle(
                                  color: colorText,
                                  fontSize: textSize * 1.2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          // description
                          Expanded(
                              child: Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                              child: TextWidget(
                                text: description,
                                size: textSize,
                                color: colorText,
                                textAlign: TextAlign.justify,
                                bold: false,
                                maxLines: sizingInformation.isMobile
                                    ? 11
                                    : sizingInformation.isTablet
                                        ? 8
                                        : 5,
                              ),
                            ),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}

import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// the simplest card with pure text and optional title
class CardText extends StatelessWidget {
  /// [title] can be omitted by null
  const CardText(
      {required this.title,
      required this.description,
      Color? colorCardBackground,
      Color? textColor,
      double? textSize,
      required this.height,
      int? maxLines,
      TextAlign? textAlign})
      : colorCardBackground = colorCardBackground ?? Colors.redAccent,
        textColor = textColor ?? Colors.white,
        textSize = textSize ?? 18,
        maxLines = maxLines ?? 5,
        textAlign = textAlign ?? TextAlign.center;

  /// card background
  final Color colorCardBackground;

  /// text color
  final Color textColor;

  /// size of the text
  final double textSize;

  /// size of the widget
  final double height;

  /// alignment
  final TextAlign textAlign;

  /// max lines of the text for resize
  final int maxLines;

  /// title of the card
  final String? title;

  /// main text of the card
  final String description;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          SizedBox(
            height: height,
            width: sizingInformation.isDesktop
                ? MediaQuery.of(context).size.width * 0.45
                : MediaQuery.of(context).size.width * 0.9,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: colorCardBackground,
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
                    child: title == null
                        ? const SizedBox.shrink()
                        : Text(title!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: textSize * 1.2,
                                color: textColor)),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        child: TextWidget(
                          text: description,
                          textAlign: textAlign,
                          bold: false,
                          size: textSize,
                          color: textColor,
                          maxLines: maxLines,
                        )),
                  )
                ],
              ),
            ),
          ));
}

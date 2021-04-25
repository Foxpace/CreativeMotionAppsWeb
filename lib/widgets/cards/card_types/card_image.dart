import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [CardImage] card with subtitle to it - no interaction
class CardImage extends StatelessWidget {

  /// default constructor
  const CardImage(
      {required this.imagePath,
        required this.colorCardBackground,
        this.subtitle,
        Color? colorText})
      : colorText = colorText ?? Colors.white;

  /// pat to image to show
  final String imagePath;
  /// title for the card
  final String? subtitle;
  /// color background
  final Color colorCardBackground;
  /// color text
  final Color colorText;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
    builder: (BuildContext context, SizingInformation sizingInformation) =>
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: colorCardBackground,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  Expanded(child: Image.asset(imagePath)),
                  if (subtitle == null) const SizedBox.shrink() else Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      text: subtitle!,
                      size: 20,
                      maxLines: 2,
                      color: colorText,
                      bold: true,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )),
  );
}
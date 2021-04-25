import 'package:creative_motion_app/widgets/cards/card_types/card_text.dart';
import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [CardTextIcon] extension to CartText,
/// where image can be added on top for desktop app

class CardTextIcon extends CardText {
  ///default constructor
  const CardTextIcon(
      {required String title,
      required String description,
      this.imagePath,
      Color? colorCardBackGround,
      Color? colorText,
      double? textSize,
      int? maxLines,
      double? height,
      TextAlign? textAlign})
      : super(
            title: title,
            description: description,
            height: height ?? 475,
            colorCardBackground: colorCardBackGround,
            textSize: textSize,
            textColor: colorText,
            maxLines: maxLines,
            textAlign: textAlign);

  /// optional image to add to text
  final String? imagePath;

  /// column card
  Widget getColumn(
          BuildContext context, SizingInformation? sizingInformation) =>
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (imagePath != null)
              Center(child: Image.asset(imagePath!))
            else
              const SizedBox.shrink(),
            if (title != null)
              HelperUI.getTitle(title!, textSize * 1.2, textColor)
            else
              const SizedBox.shrink(),
            HelperUI.getTextDescription(
                description, textSize, maxLines, textAlign)
          ]);

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          SizedBox(
            height: height,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: colorCardBackground,
              elevation: 10,
              child: SizedBox(
                  height: height, child: getColumn(context, sizingInformation)),
            ),
          ));
}

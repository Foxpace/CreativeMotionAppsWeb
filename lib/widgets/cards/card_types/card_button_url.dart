import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:creative_motion_app/widgets/cards/card_types/card_text_icon.dart';
import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:creative_motion_app/widgets/views/buttons.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [CardButtonURL] contains title, text and
/// below it button to open web page on new tab
/// uses fields of the [CardTextIcon] and
/// its methods for row and column formation
class CardButtonURL extends CardTextIcon {
  /// [imagePath] can be null and the icon will be omitted
  const CardButtonURL(
      {required String title,
      required String description,
      required this.url,
      String? imagePath,
      Color? colorCardBackGround,
      Color? colorText,
      TextAlign? textAlign,
      double? height,
      double? textSize})
      : super(
            title: title,
            height: height,
            description: description,
            imagePath: imagePath,
            colorText: colorText,
            colorCardBackGround: colorCardBackGround,
            textAlign: textAlign,
            textSize: textSize);

  /// url to change after clicking the card
  final String url;

  /// row formation
  Row getRow(BuildContext context, SizingInformation? sizingInformation) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: title == null
                    ? const SizedBox.shrink()
                    : HelperUI.getTitle(title!, textSize * 1.2, textColor),
              ),
              Expanded(
                child: HelperUI.getTextDescription(
                    description, textSize, maxLines, textAlign),
              ),
              NavigationButton(
                  text: Strings.visit_web,
                  icon: R.resource_image_url,
                  url: url,
                  internal: null)
            ],
          ),
        ),
      ]);

  @override
  Column getColumn(
          BuildContext context, SizingInformation? sizingInformation) =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        if (imagePath != null)
          Center(child: Image.asset(imagePath!))
        else
          const SizedBox.shrink(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (title == null)
              const SizedBox.shrink()
            else
              HelperUI.getTitle(title!, textSize * 1.2, textColor),
            HelperUI.getTextDescription(
                description, textSize, maxLines, textAlign),
            NavigationButton(
                text: Strings.visit_web,
                icon: R.resource_image_url,
                url: url,
                internal: null)
          ],
        )
      ]);
}

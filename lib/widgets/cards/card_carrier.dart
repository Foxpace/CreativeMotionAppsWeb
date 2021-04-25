import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/widgets/cards/card_types/card_hover_url.dart';
import 'package:creative_motion_app/widgets/cards/card_types/card_text_icon.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// template class for the getter of the multiple cards of choice
class CardCarrier {
  /// getter method for custom cards
  List<Widget> getCards(
      BuildContext buildContext, SizingInformation sizingInformation) {
    return <Widget>[];
  }
}

/// [FeatureGenerator] creates unified cards for the [FeaturePage], which are
/// then arranged in needed way
class FeatureGenerator extends CardCarrier {
  /// default constructor
  FeatureGenerator({
    required this.images,
    required this.titles,
    required this.descriptions,
    required this.textSize,
    Color? colorCard,
    Color? colorText,
  })  : colorCardBackground = colorCard ?? CustomColors.soft_red,
        colorText = colorText ?? CustomColors.white;

  /// list of images in order
  final List<String>? images;
  /// list of titles
  final List<String> titles;
  /// list of descriptions
  final List<String> descriptions;
  /// color of the text
  final Color colorText;
  /// background of the card
  final Color colorCardBackground;
  /// size of the text, titles are scaled with 1.2
  final double textSize;

  @override
  List<Widget> getCards(
          BuildContext buildContext, SizingInformation sizingInformation) =>
      List<Widget>.generate(
          titles.length,
          (int i) => CardTextIcon(
              title: titles[i],
              description: descriptions[i],
              imagePath: images != null ? images![i] : null,
              colorCardBackGround: colorCardBackground,
              colorText: colorText,
              textSize: textSize));
}

/// clickable cards for the carousel, which are highlighted on hover
/// after clicking the new site by URL is shown
class MediaGenerator extends CardCarrier {

  ///
  MediaGenerator(
      {required this.pathsImages,
        required this.urls,
        required this.colorSelected,
        required this.colorUnselected,
        required this.subtitles});

  /// list of images
  final List<String> pathsImages;
  /// after clicking of the card -> new page url
  final List<String> urls;
  /// text under image
  final List<String> subtitles;
  /// color of the card, when the mouse is on it
  final Color colorSelected;
  /// mouse is out of the card - color
  final Color colorUnselected;

  @override
  List<Widget> getCards(
          BuildContext buildContext, SizingInformation sizingInformation) =>
      List<Widget>.generate(
          urls.length,
          (int i) => CardHoverUrl(
                imagePath: pathsImages[i],
                url: urls[i],
                subtitle: subtitles[i],
                colorCardBackGroundSelected: colorSelected,
                colorCardBackGroundUnselected: colorUnselected,
              ));
}

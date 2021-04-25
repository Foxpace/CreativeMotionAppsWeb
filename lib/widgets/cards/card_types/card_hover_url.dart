import 'package:creative_motion_app/navigation/url_navigator.dart';
import 'package:creative_motion_app/widgets/cards/card_types/card_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// creates card with image and title, which is clickable and
/// shows new page on click
/// on hover, the card can change color
class CardHoverUrl extends StatefulWidget {
  /// [url] and [imagePath] are required to create this card
  const CardHoverUrl(
      {required this.url,
      required this.imagePath,
      this.subtitle,
      Color? colorCardBackGroundUnselected,
      Color? colorCardBackGroundSelected})
      : colorCardBackgroundUnselected =
            colorCardBackGroundUnselected ?? Colors.redAccent,
        colorCardBackgroundSelected = colorCardBackGroundSelected ??
            const Color.fromARGB(255, 255, 125, 125);

  /// URL to change after click
  final String url;

  /// image to show
  final String imagePath;

  /// optional subtitle under the image
  final String? subtitle;

  /// color for background - unselected
  final Color colorCardBackgroundUnselected;

  /// color for background - selected
  final Color colorCardBackgroundSelected;

  @override
  _CardHoverUrlState createState() {
    return _CardHoverUrlState(imagePath, url, subtitle,
        colorCardBackgroundUnselected, colorCardBackgroundSelected);
  }
}

class _CardHoverUrlState extends State<CardHoverUrl> {

  _CardHoverUrlState(this.imagePath, this.url, this.subtitle,
      this.colorCardBackGroundUnselected, this.colorCardBackGroundSelected);

  String imagePath;
  String? subtitle;
  Color colorCardBackGroundUnselected;
  Color colorCardBackGroundSelected; // selected / unselected
  bool hovering = false; // flag for hoovering -> change color
  String url;

  /// usage of [InkWell] to interact with mouse - usage of stateful widget
  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          InkWell(
            onTap: () => WebUrlDelegate.launchURL(url),
            onHover: (bool hovering) => <void>{
              if (mounted)
                <void>{
                  setState(() {
                    this.hovering = hovering;
                  })
                }
            },
            child: CardImage(
                imagePath: imagePath,
                colorCardBackground: hovering
                    ? colorCardBackGroundSelected
                    : colorCardBackGroundUnselected,
                subtitle: subtitle),
          ));
}

import 'package:carousel_slider/carousel_controller.dart';
import 'package:creative_motion_app/widgets/cards/card_carrier.dart';
import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// carousel as part of the page and its own controller
/// can be modified to hold any widget as necessary
class CarouselCardPage extends StatelessWidget {
  /// default constructor
  CarouselCardPage(
      {required this.title,
      required this.cardCarrier,
      required this.colorBackground,
      Color? titleColor,
      double? titleSize,
      double? siteSize})
      : siteSize = siteSize ?? 500,
        titleColor = titleColor ?? Colors.white,
        titleSize = titleSize ?? 60;

  /// color of the background of carousel
  final Color colorBackground;

  /// color of the title
  final Color titleColor;

  /// title of the page
  final String title;

  /// carrier to create all the cards
  final CardCarrier cardCarrier;

  /// size of the site
  final double siteSize;

  /// size of the title
  final double titleSize;

  /// controller
  final CarouselController controller = CarouselController();

  /// creation of the site
  Container getPages(
          BuildContext context, SizingInformation sizingInformation) =>
      Container(
          height: siteSize,
          color: colorBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HelperUI.getTitle(title, titleSize, titleColor),
              Expanded(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width *
                          (sizingInformation.isMobile ? 1 : 0.75),
                      child: HelperUI.getAppCarousel(
                          context,
                          cardCarrier.getCards(context, sizingInformation),
                          controller,
                          true))),
            ],
          ));

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          getPages(context, sizingInformation));
}

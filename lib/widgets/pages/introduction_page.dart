import 'package:carousel_slider/carousel_slider.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:creative_motion_app/widgets/views/buttons.dart';
import 'package:creative_motion_app/widgets/views/image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [IntroductionPage] uses big title text and description for the left side
/// of the screen. The second part is covered with carousel
/// with phone dimensions, the title and carousel are in column
class IntroductionPage extends StatelessWidget {
  /// default constructor
  IntroductionPage(
      {required this.title,
      required this.description,
      required this.colorBackground,
      required this.images,
      required this.buttons,
      double? scaleCarousel,
      required this.useParentHeight,
      double? siteSize,
      Color? colourText})
      : colorText = colourText ?? CustomColors.white,
        siteSize = siteSize ?? 600,
        scaleCarousel = scaleCarousel ?? 1;

  /// controller of carousel
  final CarouselController controller = CarouselController();

  /// string with title
  final String title;

  /// string with description
  final String description;

  /// background color
  final Color colorBackground;

  /// color of the text
  final Color colorText;

  /// list of images for carousel
  final List<String> images;

  /// list of buttons under the title
  final List<NavigationButton>? buttons;

  /// site size
  final double siteSize;

  /// scale of the carousel
  final double scaleCarousel;

  /// use parent height - to make page whole screen
  final bool useParentHeight;

  /// get desktop version
  Container getPagesDesktop(
          BuildContext context, SizingInformation sizingInformation) =>
      Container(
          height:
              useParentHeight ? MediaQuery.of(context).size.height : siteSize,
          color: colorBackground,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // title and descriptions
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    HelperUI.getTitle(title, 80, colorText),
                    _getSummary(sizingInformation)
                  ],
                ),
              ),

              // carousel
              SizedBox(
                  height: (useParentHeight
                          ? MediaQuery.of(context).size.height
                          : siteSize) *
                      scaleCarousel,
                  width: MediaQuery.of(context).size.width / 2,
                  child: _getCarousel(context))
            ],
          ));

  /// one column for the phone
  Widget getPagesPhone(
          BuildContext context, SizingInformation sizingInformation) =>
      Column(children: <Widget>[
        Container(
            color: colorBackground,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HelperUI.getTitle(
                      title, sizingInformation.isTablet ? 80 : 60, colorText),
                  _getSummary(sizingInformation)
                ],
              ),
            )),
        Container(
            height:
                useParentHeight ? MediaQuery.of(context).size.height : siteSize,
            width: MediaQuery.of(context).size.width,
            color: colorBackground,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _getCarousel(context),
            ))
      ]);

  Widget _getCarousel(BuildContext context) => images.length > 1
      ? HelperUI.getAppCarousel(
          context,
          images
              .map(
                (String path) =>
                    getClickableImage(context, path, null, Colors.transparent),
              )
              .toList(),
          controller,
          true)
      : getClickableImage(context, images[0], null, Colors.transparent);

  /// summary is added with button if available
  Widget _getSummary(SizingInformation sizingInformation) {
    final List<Widget> summary = <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: TextWidget(
            text: description,
            size: 18,
            textAlign: TextAlign.justify,
            color: colorText,
            bold: false,
            maxLines: 25),
      ),
    ];

    if (buttons != null) {
      summary.insert(
          0,
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: buttons!,
              )));
    }

    return Center(child: Column(children: summary));
  }

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
          // Check the sizing information here and return your UI
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return getPagesDesktop(context, sizingInformation);
          }
          return getPagesPhone(context, sizingInformation);
        },
      );
}

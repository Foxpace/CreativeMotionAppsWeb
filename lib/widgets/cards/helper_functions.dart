import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:flutter/material.dart';

/// [HelperUI] provides static methods to generate simple UI texts,
/// carousels and etc.
class HelperUI {
  /// unified way for the titles
  static Widget getTitle(String title, double size, Color textColour) =>
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextWidget(
              text: title,
              textAlign: TextAlign.center,
              size: size,
              maxLines: 2,
              color: textColour,
              bold: true),
        ),
      );

  /// unified way for the description texts
  static Widget getTextDescription(
          String text, double textSize, int maxLines, TextAlign textAlign) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
        child: TextWidget(
            text: text,
            size: textSize,
            textAlign: textAlign,
            color: CustomColors.white,
            bold: false,
            maxLines: maxLines),
      );

  /// method to get Carousel widget with [widgets] of choice and unified options
  /// widget comes with arrows, which are not included in original library
  static Widget getAppCarousel(BuildContext context, List<Widget> widgets,
          CarouselController controller, bool autoPlay) =>
      Stack(children: <Widget>[
        Center(
          child: CarouselSlider(
              items: widgets
                  .map((Widget w) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: w,
                      ))
                  .toList(),
              carouselController: controller,
              options: CarouselOptions(
                  height: MediaQuery.of(context).copyWith().size.height,
                  autoPlay: autoPlay,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  onPageChanged:
                      (int index, CarouselPageChangedReason reason) =>
                          <void>{})),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: CustomColors.white,
              ),
              onPressed: () {
                controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: CustomColors.white,
              ),
              onPressed: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
              },
            ),
          ),
        )
      ]);
}

/// wrapper for the [AutoSizeText] for reproducible texts across site
class TextWidget extends StatelessWidget {
  /// default constructor
  const TextWidget(
      {required this.text,
      required this.size,
      required this.color,
      required this.textAlign,
      required this.bold,
      required this.maxLines});

  /// simplified constructor
  const TextWidget.basic(
      {required this.text, required this.size, required this.maxLines})
      : color = CustomColors.white,
        textAlign = TextAlign.justify,
        bold = false;

  /// bold text
  final bool bold;

  /// text
  final String text;

  /// size of the text
  final double size;

  /// color of the text
  final Color color;

  /// max lines in text widget
  final int maxLines;

  /// align text
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) => AutoSizeText(
        text,
        textAlign: textAlign,
        minFontSize: 10,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: bold ? FontWeight.bold : null,
        ),
        maxLines: maxLines,
      );
}

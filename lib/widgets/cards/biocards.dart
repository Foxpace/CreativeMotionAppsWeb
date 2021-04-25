import 'package:creative_motion_app/resources/strings.dart';
import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [DescriptionCard] is used by programming languages in resume
/// not actually used, because of rigid description
class DescriptionCard extends StatelessWidget {
  /// default constructor
  const DescriptionCard(
      {required this.leftTitle,
      required this.rightTitle,
      required this.subTitle,
      required this.description,
      required this.buttons,
      double? textSize,
      Color? colorBackground,
      Color? colorText})
      : colorBackground = colorBackground ?? Colors.white70,
        colorText = colorText ?? Colors.black,
        textSize = textSize ?? 20;

  /// header left title
  final String leftTitle;

  /// header right title
  final String rightTitle;

  /// header subtitle
  final String subTitle;

  /// main text
  final String description;

  /// list of buttons
  final List<Widget> buttons;

  /// background color
  final Color colorBackground;

  /// text color
  final Color colorText;

  /// text size
  final double textSize;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 80,
                  ),
                  child: Card(
                      elevation: 1,
                      color: colorBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            // titles
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(
                                  child: TextWidget(
                                      text: leftTitle,
                                      size: textSize * 1.5,
                                      color: colorText,
                                      textAlign: TextAlign.center,
                                      bold: true,
                                      maxLines: 1),
                                ),
                                Expanded(
                                  child: TextWidget(
                                      text: rightTitle,
                                      size: textSize * 1.5,
                                      color: colorText,
                                      textAlign: TextAlign.center,
                                      bold: true,
                                      maxLines: 2),
                                )
                              ],
                            ),
                          ),
                          // subtitle and text below
                          TextWidget(
                              text: subTitle,
                              size: textSize * 1.1,
                              color: colorText,
                              textAlign: TextAlign.center,
                              bold: false,
                              maxLines: 1),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextWidget(
                                text: description,
                                size: textSize,
                                color: colorText,
                                textAlign: TextAlign.justify,
                                bold: false,
                                maxLines: 100),
                          ),
                          // buttons at the bottom
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: buttons,
                            ),
                          )
                        ],
                      )))));
}

/// [DescriptionExpansionCard] uses fields of [DescriptionCard]
/// is used by programming languages in resume
/// uses ExpansionTile to hide description to obtain cards of the same height
/// site is transformed by expansion then
class DescriptionExpansionCard extends DescriptionCard {
  /// default constructor
  const DescriptionExpansionCard(
      {required this.sizingInformation,
      required String leftTitle,
      required String rightTitle,
      required String subTitle,
      required String description,
      required List<Widget> buttons,
      double? textSize,
      this.width,
      this.height,
      this.expansion,
      Color? colorBackground,
      Color? colorText})
      : super(
            buttons: buttons,
            leftTitle: leftTitle,
            rightTitle: rightTitle,
            subTitle: subTitle,
            description: description,
            textSize: textSize,
            colorBackground: colorBackground,
            colorText: colorText);

  /// width of the container
  final double? width;

  /// height of the container
  final double? height;

  /// to use expansion tile or text
  final bool? expansion;

  /// sizing information from parent
  final SizingInformation? sizingInformation;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
            width: width,
            height: height,
            child: Card(
              color: colorBackground,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  // titles
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextWidget(
                                  text: leftTitle,
                                  size: textSize * 1.8,
                                  color: colorText,
                                  textAlign: TextAlign.center,
                                  bold: true,
                                  maxLines: 2),
                            )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextWidget(
                                  text: rightTitle,
                                  size: textSize * 1.8,
                                  color: colorText,
                                  textAlign: TextAlign.center,
                                  bold: true,
                                  maxLines: 2),
                            )),
                          ],
                        ),
                      )),
                  // subtitle
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(subTitle,
                        style: TextStyle(
                            fontSize: textSize * 1.2,
                            fontWeight: FontWeight.bold)),
                  ),
                  // expansion tile with description
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: expansion != null
                        ? (expansion!
                            ? ExpansionTile(
                                title: Center(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 8, 8, 8),
                                  child: Text(
                                    Strings.bio_more_info,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: textSize * 1.2,
                                        color: colorText),
                                  ),
                                )),
                                children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(description,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontSize: textSize,
                                              color: colorText)),
                                    )
                                  ])
                            : Text(description,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: textSize, color: colorText)))
                        : Text(description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: textSize, color: colorText)),
                  ),
                  // buttons to show
                  if (buttons.isEmpty)
                    const SizedBox.shrink()
                  else
                    _getCardButtons(context)
                ]),
              ),
            )),
      );

  Widget _getCardButtons(BuildContext context) {
    // if(sizingInformation != null){
    //   if(sizingInformation!.isDesktop){
    //     return Container(
    //       height: getValueForScreenType<double>(
    //         context: context,
    //         mobile: buttons.length > 4 ? 150 : 90,
    //         tablet: buttons.length <= 1 ? 45 : 90,
    //         desktop: buttons.length <= 1 ? 60 : 120,
    //       ),
    //       child: Wrap(
    //         alignment: WrapAlignment.spaceEvenly,
    //         children: buttons,
    //       ));
    //   }
    // }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: buttons.length * 60 + 8,
        child: Column(
          children: buttons,
        ),
      ),
    );
  }
}

/// description list with fields and values
class DescriptionList extends StatelessWidget {
  /// default constructor
  const DescriptionList(
      {required this.leftTitle,
      required this.rightTitle,
      required this.subTitle,
      required this.content,
      double? textSize,
      Color? colorBackground,
      Color? colorText})
      : colorText = colorText ?? Colors.black,
        colorBackground = colorBackground ?? Colors.white,
        textSize = textSize ?? 18;

  /// widgets to add under the titles
  final List<Widget> content;

  /// header left title
  final String leftTitle;

  /// header right title
  final String rightTitle;

  /// header subtitle
  final String subTitle;

  /// background color
  final Color colorBackground;

  /// text color
  final Color colorText;

  /// text size
  final double textSize;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
            child: Card(
          color: colorBackground,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        height: 75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextWidget(
                                  text: leftTitle,
                                  size: textSize * 1.8,
                                  color: colorText,
                                  textAlign: TextAlign.center,
                                  bold: true,
                                  maxLines: 2),
                            )),
                            if (rightTitle == '')
                              const SizedBox.shrink()
                            else
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextWidget(
                                    text: rightTitle,
                                    size: textSize * 1.8,
                                    color: colorText,
                                    textAlign: TextAlign.center,
                                    bold: true,
                                    maxLines: 2),
                              )),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(subTitle,
                        style: TextStyle(
                            color: colorText,
                            fontSize: textSize * 1.2,
                            fontWeight: FontWeight.bold)),
                  ),
                  ...content,
                ]),
          ),
        )),
      );
}

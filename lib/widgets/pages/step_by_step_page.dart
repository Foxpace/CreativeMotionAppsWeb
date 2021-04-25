import 'package:creative_motion_app/widgets/cards/card_types/card_step.dart';
import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// creates column of cards with indexes on left side
class StepByStepPage extends StatelessWidget {
  /// [title] is title of the section, with [_titles] of the cards,
  /// their [_descriptions] and [_cardColor]
  const StepByStepPage(
      this.title, this._titles, this._descriptions, this._cardColor);

  /// title of the page
  final String title;
  final List<String> _titles;
  final List<String> _descriptions;
  final Color _cardColor;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          SizedBox(
            width: _getWidth(context, sizingInformation),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: HelperUI.getTitle(title,
                      sizingInformation.isMobile ? 40 : 60, Colors.white),
                ),
                ...List<Widget>.generate(
                    _titles.length,
                    (int index) => CardStep(
                          index: index,
                          title: _titles[index],
                          description: _descriptions[index],
                          colorBackground: _cardColor,
                        ))
              ],
            ),
          ));

  double _getWidth(BuildContext context, SizingInformation sizingInformation) {
    if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
      return MediaQuery.of(context).size.width * 0.6;
    }

    if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
      return MediaQuery.of(context).size.width * 0.9;
    }
    return MediaQuery.of(context).size.width;
  }
}

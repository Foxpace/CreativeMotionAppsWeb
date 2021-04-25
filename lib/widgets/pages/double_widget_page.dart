import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// simple page to show 2 widgets of own creation
class DoubleWidgetPage extends StatelessWidget {
  /// [row] forces page to be column, if it is false,
  /// [maxHeight] needs to be defined for correct display
  const DoubleWidgetPage(
      {required this.title,
      required this.widget1,
      required this.widget2,
      required this.titleColor,
      double? maxHeight,
      required this.row,
      required this.colorBackground})
      : maxHeight = maxHeight ?? 1000;

  /// title of the page
  final String title;
  /// widget 1
  final Widget widget1;
  /// widget 2
  final Widget widget2;
  /// color of the title
  final Color titleColor;
  /// color of the background
  final Color colorBackground;
  /// max height of the container
  final double maxHeight;
  /// build only row
  final bool row;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          row
              ? Container(
                  color: colorBackground,
                  child: sizingInformation.isDesktop
                      ? _getRow(context, sizingInformation)
                      : _getColumn(context, sizingInformation))
              : Container(
                  color: colorBackground,
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width *
                          _getWidth(sizingInformation)),
                  child: _getColumn(context, sizingInformation)));

  /// [_getWidth] defines with of the main container, because text would be too
  /// wide without some regulation
  double _getWidth(SizingInformation sizingInformation) {
    if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
      return row ? 0.9 : 0.6;
    }

    if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
      return row ? 0.9 : 0.75;
    }

    if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
      return 0.9;
    }

    return 1.0;
  }

  /// [_getColumn] defines widget into one column
  Column _getColumn(
          BuildContext buildContext, SizingInformation sizingInformation) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          HelperUI.getTitle(
              title, sizingInformation.isDesktop ? 60 : 40, titleColor),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget2,
          )
        ],
      );

  /// [_getRow] defines widget into one row
  Column _getRow(
          BuildContext buildContext, SizingInformation sizingInformation) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          HelperUI.getTitle(
              title, sizingInformation.isDesktop ? 60 : 40, titleColor),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: widget1),
                Expanded(child: widget2)
              ])
        ],
      );
}

import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:timeline_tile/timeline_tile.dart';

///[TimeLinePage] creates time line with [TimeLineTile] of custom creation
class TimeLinePage extends StatelessWidget {
  /// title of the page
  final String title;

  /// content to add to timeline
  late final List<TimelineTile> timeLine;

  /// color of th background
  late final Color colorBackground;

  /// color of the text
  late final Color colorText;

  /// color of the timelie
  late final Color colorTimeLine;

  /// pass custom widgets, which will be transformed to to timeline objects
  // ignore: sort_constructors_first
  TimeLinePage(
      {required this.title,
      required List<Widget> content,
      Color? colorBackGround,
      Color? colorText,
      Color? colorTimeLine}) {
    colorBackground = colorBackGround ?? Colors.white;
    this.colorText = colorText ?? Colors.white;
    this.colorTimeLine = colorTimeLine ?? Colors.white;

    // generation of the timeline
    timeLine = List<TimelineTile>.generate(
        content.length,
        (int index) => TimelineTile(
            isFirst: index == 0,
            isLast: index == (content.length - 1),
            beforeLineStyle: const LineStyle(color: Colors.white),
            afterLineStyle: const LineStyle(color: Colors.white),
            indicatorStyle: const IndicatorStyle(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            ),
            endChild: content[index]));
  }

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          Container(
            width: MediaQuery.of(context).size.width,
            color: colorBackground,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Center(
                child: SizedBox(
                  width: sizingInformation.isDesktop
                      ? MediaQuery.of(context).size.width * 0.6
                      : null,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextWidget(
                          text: title,
                          size: 50,
                          color: Colors.white,
                          textAlign: TextAlign.center,
                          bold: true,
                          maxLines: 1),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 70, 16),
                        child: Column(children: timeLine),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
}

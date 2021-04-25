import 'package:flutter/material.dart';

/// [TabFiller] fills the widget under the NESTED_PAGE header and TabBar
class TabFiller extends StatelessWidget {

  /// default constructor
  const TabFiller(
      {Key? key,
        required this.title,
        required this.content,
        required this.dividerSize})
      : super(key: key);

  /// title of the tab filler
  final String title;
  /// divider to put between widgets
  final double dividerSize;
  /// widgets to add to scroller
  final List<Widget> content;

  @override
  Widget build(BuildContext context) => SizedBox(
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: content.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding:
                EdgeInsets.fromLTRB(0, dividerSize / 2, 0, dividerSize / 2),
            child: content[index],
          ),
        ),
      );
}

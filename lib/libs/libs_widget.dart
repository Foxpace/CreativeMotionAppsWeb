import 'package:creative_motion_app/libs/libs_content.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [LibsWidget] library widget to showcase library
class LibsWidget extends StatelessWidget {
  /// [LibsContent] for the constructor - information to show
  const LibsWidget(this._libsContent);

  final LibsContent _libsContent;

  final Color _textColor = CustomColors.white;
  final double _textSize = 20;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) =>
            Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
              elevation: 5,
              color: CustomColors.black_faded,
              child: SizedBox(
                width: MediaQuery.of(context).copyWith().size.width *
                    (sizingInformation.isDesktop ? 0.7 : 1),
                child: Align(
                  child: Column(
                    children: <Widget>[
                      // header of the library - title, links
                      Container(
                        color: CustomColors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: Text(_libsContent.title,
                                          textAlign: TextAlign.center,
                                          textScaleFactor: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: _textSize,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                              // icons and languages
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          ..._libsContent.navButtonsIcons,
                                          _libsContent.programmingLanguage
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      if (sizingInformation.isMobile)
                        _getColumn()
                      else
                        _getRow(),
                    ],
                  ),
                ),
              )),
        ),
      );

  /// [_getRow] creates place for description (left) and features (right)
  Widget _getRow() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // description
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                        text: _libsContent.subtitle,
                        size: _textSize,
                        textAlign: TextAlign.justify,
                        color: _textColor,
                        bold: true,
                        maxLines: 2),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                        text: _libsContent.description,
                        size: _textSize,
                        textAlign: TextAlign.justify,
                        color: _textColor,
                        bold: false,
                        maxLines: 10),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Expanded(
              // features
              child: Center(
                child: SizedBox(
                  width: 450,
                  child: TextWidget(
                      text: _libsContent.features,
                      size: _textSize,
                      textAlign: TextAlign.justify,
                      color: _textColor,
                      bold: false,
                      maxLines: 10),
                ),
              ),
            ),
          ],
        ),
      );

  /// [_getColumn] creates place for description and features in column
  Widget _getColumn() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                  text: _libsContent.subtitle,
                  size: _textSize,
                  textAlign: TextAlign.justify,
                  color: _textColor,
                  bold: true,
                  maxLines: 2),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                  text: _libsContent.description,
                  size: _textSize,
                  textAlign: TextAlign.justify,
                  color: _textColor,
                  bold: false,
                  maxLines: 10),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                  text: _libsContent.features,
                  size: _textSize,
                  textAlign: TextAlign.justify,
                  color: _textColor,
                  bold: false,
                  maxLines: 10),
            ),
          ],
        ),
      );
}

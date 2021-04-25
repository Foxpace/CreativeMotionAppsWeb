import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/personal_strings.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:creative_motion_app/widgets/views/buttons.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [BioIntroductionPage] header for the bio page
/// with profile picture and hello text
class BioIntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          Container(
            color: Colors.blue,
            child: sizingInformation.isDesktop
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _getContent(context, sizingInformation))
                : Column(
                    children: _getContent(context, sizingInformation),
                  ),
          ));

  /// [_getContent] builds content for the page
  List<Widget> _getContent(
          BuildContext context, SizingInformation sizingInformation) =>
      <Widget>[
        // image picture
        SizedBox(
          width: sizingInformation.isDesktop
              ? MediaQuery.of(context).size.width / 2
              : null,
          child: Align(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                R.resource_image_me,
                fit: BoxFit.contain, // no deformities to the image
                width: sizingInformation.isDesktop ? null : 250,
                height: sizingInformation.isDesktop ? null : 250,
              ),
            ),
          ),
        ),
        // hello text
        SizedBox(
          width: sizingInformation.isDesktop
              ? MediaQuery.of(context).size.width / 2
              : null,
          child: Align(
              // want to align text to left if they are in row
              alignment: sizingInformation.isDesktop
                  ? Alignment.centerLeft
                  : Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    0,
                    sizingInformation.isDesktop ? 0 : 25,
                    sizingInformation.isDesktop ? 50 : 0,
                    0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextWidget(
                      text: PersonalStrings.introduction,
                      size: sizingInformation.isDesktop ? 50 : 25,
                      color: CustomColors.white,
                      textAlign: TextAlign.justify,
                      bold: true,
                      maxLines: 4,
                    ),
                    // links to linkedin and github
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        children: const <NavigationIcon>[
                          NavigationIcon(
                              Strings.bio_linkedin,
                              R.resource_image_linkedin_square,
                              PersonalStrings.linkedin,
                              null),
                          NavigationIcon(
                              Strings.bio_github,
                              R.resource_image_github_square,
                              PersonalStrings.github,
                              null),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        )
      ];
}

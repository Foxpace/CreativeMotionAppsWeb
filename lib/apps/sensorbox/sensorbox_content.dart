import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:creative_motion_app/widgets/cards/card_carrier.dart';
import 'package:creative_motion_app/widgets/page_init.dart';
import 'package:creative_motion_app/widgets/pages/feature_page.dart';
import 'package:creative_motion_app/widgets/pages/introduction_page.dart';
import 'package:creative_motion_app/widgets/views/buttons.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// representation of the SensorBox app page
class SensorBoxContent extends PageContent {
  /// no need for implementation of objects in constructor
  SensorBoxContent(Function(BuildContext context, String url) navigation)
      : super(navigation);

  @override
  final Color colorBackground = CustomColors.black;

  /// [introductionPage] header of the site
  IntroductionPage introductionPage = IntroductionPage(
      title: Strings.sensorbox_title,
      description: Strings.sensorbox_description,
      colorBackground: CustomColors.blue,
      images: R.resource_image_sensorbox_images,
      useParentHeight: false,
      buttons: const <NavigationButton>[
        // button to google play
        NavigationButton.coloured(
          text: Strings.about_google_play,
          icon: R.resource_image_google_play,
          url: R.url_google_play_sensorbox,
          backgroundColor: Colors.transparent,
          textColor: CustomColors.white,
          borderColor: CustomColors.white,
        ),
        // button to github page
        NavigationButton.coloured(
          text: Strings.about_github,
          icon: R.resource_image_github,
          url: R.url_github_sensorbox,
          backgroundColor: Colors.transparent,
          textColor: CustomColors.white,
          borderColor: CustomColors.white,
        ),
      ]);

  /// [featurePage] features of the SensorBox
  FeaturePage featurePage = FeaturePage(
    cardCarrier: FeatureGenerator(
      images: R.resource_image_sensorbox_features,
      titles: Strings.sensorbox_features_titles,
      descriptions: Strings.sensorbox_features,
      colorCard: CustomColors.soft_red,
      colorText: CustomColors.white,
      textSize: 20,
    ),
    colorBackground: CustomColors.blue,
    colorTitle: CustomColors.white,
  );

  @override
  List<Widget> getPagesDesktop(
          BuildContext context, SizingInformation sizingInformation) =>
      <Widget>[introductionPage, featurePage];

  @override
  List<Widget> getPagesPhone(
          BuildContext context, SizingInformation sizingInformation) =>
      <Widget>[introductionPage, featurePage];

}

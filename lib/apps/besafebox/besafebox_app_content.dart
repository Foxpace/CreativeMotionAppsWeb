import 'package:creative_motion_app/navigation/url_navigator.dart';
import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:creative_motion_app/widgets/cards/card_carrier.dart';
import 'package:creative_motion_app/widgets/cards/card_types/card_button_url.dart';
import 'package:creative_motion_app/widgets/cards/card_types/card_text_icon.dart';
import 'package:creative_motion_app/widgets/page_init.dart';
import 'package:creative_motion_app/widgets/pages/carousel_card_page.dart';
import 'package:creative_motion_app/widgets/pages/double_widget_page.dart';
import 'package:creative_motion_app/widgets/pages/feature_page.dart';
import 'package:creative_motion_app/widgets/pages/introduction_page.dart';
import 'package:creative_motion_app/widgets/views/buttons.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [BeSafeBoxAppContent] represents text about Android app
class BeSafeBoxAppContent extends PageContent {

  /// constructor with [navigation] callback to change page if needed
  BeSafeBoxAppContent(Function(BuildContext context, String url) navigation)
      : super(navigation) {
    introductionPage = IntroductionPage(
        title: Strings.besafebox_title,
        description: Strings.besafebox_description,
        colorBackground: colorBackground,
        images: R.resource_image_besafebox_images,
        useParentHeight: false,
        buttons: <NavigationButton>[
          // button dialog for the download
          NavigationButton.coloured(
            text: Strings.about_download,
            icon: R.resource_image_download,
            url: '',
            // show dialog with option to download
            internal: (BuildContext context, String url) async {
              return showDialog<void>(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) => _showDialog(context),
              );
            },
            backgroundColor: Colors.transparent,
            textColor: CustomColors.white,
            borderColor: CustomColors.white,
          ),

          // github button
          const NavigationButton.coloured(
            text: Strings.about_github,
            icon: R.resource_image_github,
            url: R.url_github_besafebox_app,
            // do not need callback to change site
            backgroundColor: Colors.transparent,
            textColor: CustomColors.white,
            borderColor: CustomColors.white,
          ),

          // changes to research
          NavigationButton.coloured(
            text: Strings.about_research,
            icon: R.resource_image_research,
            url: R.paths_besafebox_science,
            internal: this.navigation,
            //
            backgroundColor: Colors.transparent,
            textColor: CustomColors.white,
            borderColor: CustomColors.white,
          ),
        ]);
  }

  @override
  final Color colorBackground = CustomColors.softened_grey;

  /// header of page, which has to be init in constructor
  /// for navigation callback
  late final IntroductionPage introductionPage;

  /// [_showDialog] agreement dialog prior to download
  /// of the .apk of the BeSafeBox
  AlertDialog _showDialog(BuildContext context) {
    return AlertDialog(
      title: const Text(Strings.besafebox_dialog_title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text(
              Strings.besafebox_dialog_description,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
          child: TextButton(
            onPressed: () {
              // download link to github package
              WebUrlDelegate.launchURL(R.url_besafebox_apk_download);
              Navigator.of(context).pop();
            },
            child: const Text(Strings.besafebox_dialog_button),
          ),
        ),
      ],
    );
  }

  /// [featurePage] shows features of the BeSafeBox in [CardTextIcon]
  final FeaturePage featurePage = FeaturePage(
      cardCarrier: FeatureGenerator(
        images: R.resource_image_besafebox_features,
        titles: Strings.besafebox_features_titles,
        descriptions: Strings.besafebox_features,
        textSize: 18,
        colorCard: CustomColors.soft_red,
        colorText: CustomColors.white,
      ),
      colorBackground: CustomColors.softened_grey,
      colorTitle: CustomColors.white);

  /// [carouselPage] shows media coverage of the BeSafeBox
  final CarouselCardPage carouselPage = CarouselCardPage(
      title: Strings.in_media,
      cardCarrier: MediaGenerator(
          pathsImages: R.resource_image_besafebox_media,
          urls: R.resource_urls_besafebox_media,
          subtitles: Strings.resource_besafebox_media_subtitle,
          colorSelected: CustomColors.more_soft_red,
          colorUnselected: CustomColors.soft_red),
      colorBackground: CustomColors.softened_grey);

  /// [sensorTemplateIntroduction] showcase for the familiar app as template
  final IntroductionPage sensorTemplateIntroduction = IntroductionPage(
    title: Strings.sensortemplate_title,
    description: Strings.sensortemplate_description,
    images: const <String>[R.resource_image_sensortemplate],
    colorBackground: CustomColors.softened_grey,
    colourText: CustomColors.white,
    useParentHeight: false,
    buttons: const <NavigationButton>[
      // link to github page
      NavigationButton.coloured(
        text: Strings.about_github,
        icon: R.resource_image_github,
        url: R.url_github_sensortemplate,
        backgroundColor: Colors.transparent,
        textColor: CustomColors.white,
        borderColor: CustomColors.white,
      )
    ],
  );

  /// [getPagesDesktop] context and sizing information is from Scaffold
  /// builds widgets for the page
  @override
  List<Widget> getPagesDesktop(
          BuildContext context, SizingInformation sizingInformation) =>
      <Widget>[
        introductionPage,
        featurePage,
        getAndroidProblem(context, sizingInformation),
        carouselPage,
        sensorTemplateIntroduction
      ];

  /// [getPagesPhone] context and sizing information is from Scaffold
  /// builds widgets for the page
  /// in this case they are the same for the phone and desktop
  @override
  List<Widget> getPagesPhone(
          BuildContext context, SizingInformation sizingInformation) =>
      <Widget>[
        introductionPage,
        featurePage,
        getAndroidProblem(context, sizingInformation),
        carouselPage,
        sensorTemplateIntroduction
      ];



  /// [getAndroidProblem] describes problem with the OEM battery routines
  DoubleWidgetPage getAndroidProblem(
          BuildContext buildContext, SizingInformation sizingInformation) =>
      DoubleWidgetPage(
          title: Strings.besafebox_google_play,
          colorBackground: CustomColors.softened_grey,
          titleColor: CustomColors.white,
          row: false,
          // description of the problem
          widget1: CardTextIcon(
              height: getValueForScreenType<double>(
                context: buildContext,
                mobile: 475,
                tablet: 350,
                desktop: 300,
              ),
              title: Strings.besafebox_battery_title,
              description: Strings.besafebox_battery_description,
              colorCardBackGround: CustomColors.soft_red,
              colorText: CustomColors.white,
              textSize: 18,
              maxLines: 16,
              textAlign: TextAlign.justify),
          // probable / part solution
          widget2: CardButtonURL(
              height: getValueForScreenType<double>(
                context: buildContext,
                mobile: 300,
                tablet: 250,
                desktop: 250,
              ),
              title: Strings.besafebox_more_information,
              description: Strings.besafebox_information_description,
              colorCardBackGround: CustomColors.soft_red,
              colorText: CustomColors.white,
              textSize: 18,
              textAlign: TextAlign.justify,
              url: R.url_dontkillmyapp));
}

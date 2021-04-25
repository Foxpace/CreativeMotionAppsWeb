import 'package:creative_motion_app/bio/cards_content.dart';
import 'package:creative_motion_app/bio/introduction_page.dart';
import 'package:creative_motion_app/home/home_content.dart';
import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/personal_strings.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:creative_motion_app/widgets/cards/card_carrier.dart';
import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:creative_motion_app/widgets/page_init.dart';
import 'package:creative_motion_app/widgets/pages/wrapper_page.dart';
import 'package:creative_motion_app/widgets/pages/feature_page.dart';
import 'package:creative_motion_app/widgets/pages/timeline_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [BioPage] represents CV, experiences, education, ...
class BioPage extends BioPageContent {
  /// CardWrapper needs implementation of the navigation to change site
  BioPage(Function(BuildContext context, String url) navigation)
      : super(navigation) {
    cardWrapper = WrapperPage(
        colorBackground: CustomColors.blue,
        colorText: CustomColors.white,
        title: Strings.bio_programming_skills,
        widgets: <Widget>[
          ResponsiveBuilder(
            builder:
                (BuildContext context, SizingInformation sizingInformation) =>
                    getPythonCard(sizingInformation, navigation),
          ),
          ResponsiveBuilder(
            builder:
                (BuildContext context, SizingInformation sizingInformation) =>
                    getAndroidCard(sizingInformation, navigation),
          ),
          ResponsiveBuilder(
            builder: (BuildContext context,
                    SizingInformation sizingInformation) =>
                getOtherLanguages(sizingInformation, navigation),
          )
        ]);
  }

  @override
  final int type = PageContent.webScroller;
  @override
  final Color colorBackground = CustomColors.black;

  /// [cardWrapper] page wrapper for the programming languages stuff
  /// cards are expandable
  late final WrapperPage cardWrapper;

  /// [bioIntroductionPage] creates header with
  /// profile picture and welcoming text
  final BioIntroductionPage bioIntroductionPage = BioIntroductionPage();

  /// [timeLinePageExperiences] previous job descriptions
  final TimeLinePage timeLinePageExperiences = TimeLinePage(
    title: Strings.bio_work_experience,
    content: jobs,
    colorBackGround: CustomColors.blue,
    colorText: CustomColors.white,
    colorTimeLine: Colors.white,
  );

  /// [timeLinePageEducation] - finished education levels
  final TimeLinePage timeLinePageEducation = TimeLinePage(
    title: Strings.bio_education,
    content: education,
    colorBackGround: CustomColors.blue,
    colorText: CustomColors.white,
    colorTimeLine: Colors.white,
  );

  /// [aboutMe] cards with basic information about me
  final FeaturePage aboutMe = FeaturePage(
    colorBackground: CustomColors.blue,
    title: Strings.bio_about_me,
    cardCarrier: FeatureGenerator(
      textSize: 18,
      images: R.resource_bio_images,
      titles: Strings.bio_about_me_titles,
      descriptions: PersonalStrings.getBioDescription(),
    ),
  );

  // lined up all pages to show
  @override
  List<Widget> getPagesDesktop(
          BuildContext context, SizingInformation sizingInformation) =>
      <Widget>[
        bioIntroductionPage,
        timeLinePageExperiences,
        timeLinePageEducation,
        cardWrapper,
        // tab view with all apps to show
        AppContent.getTabView(
            context: context,
            scrollable: false,
            selectedWidget: selectedWidget,
            unselectedWidget: unselectedWidget,
            textColor: CustomColors.white,
            backgroundColor: CustomColors.black,
            sizingInformation: sizingInformation,
            navigationCallback: navigation),
        aboutMe
      ];

  @override
  List<Widget> getPagesPhone(
          BuildContext context, SizingInformation sizingInformation) =>
      <Widget>[
        bioIntroductionPage,
        getPhoneCards(context, sizingInformation, jobs,
            Strings.bio_work_experience),
        getPhoneCards(context, sizingInformation, education,
            Strings.bio_education),
        cardWrapper,
        AppContent.getTabView(
            context: context,
            scrollable: true,
            selectedWidget: selectedWidget,
            unselectedWidget: unselectedWidget,
            textColor: CustomColors.white,
            backgroundColor: CustomColors.black,
            sizingInformation: sizingInformation,
            navigationCallback: navigation),
        aboutMe
      ];


  /// [getPhoneCards] BioCards does not have Page implementation, because
  /// timeline page does not fit into phone dimensions
  /// temp solution to add them into column without timeline widget
  Container getPhoneCards(
          BuildContext context,
          SizingInformation sizingInformation,
          List<Widget> cards,
          String title) =>
      Container(
        color: CustomColors.blue,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HelperUI.getTitle(title, 40, CustomColors.white),
            ...cards
          ],
        ),
      );
}

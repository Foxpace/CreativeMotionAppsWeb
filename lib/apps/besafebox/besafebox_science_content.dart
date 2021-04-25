import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:creative_motion_app/widgets/cards/card_carrier.dart';
import 'package:creative_motion_app/widgets/cards/card_types/card_text.dart';
import 'package:creative_motion_app/widgets/page_init.dart';
import 'package:creative_motion_app/widgets/pages/double_widget_page.dart';
import 'package:creative_motion_app/widgets/pages/feature_page.dart';
import 'package:creative_motion_app/widgets/pages/introduction_page.dart';
import 'package:creative_motion_app/widgets/pages/step_by_step_page.dart';
import 'package:creative_motion_app/widgets/views/buttons.dart';
import 'package:creative_motion_app/widgets/views/image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [BeSafeBoxScienceContent] shows contents about fall detection research
class BeSafeBoxScienceContent extends PageContent {


  /// [BeSafeBoxScienceContent] constructor
  /// with [navigation] callback to change sites
  BeSafeBoxScienceContent(Function(BuildContext context, String url) navigation)
      : super(navigation) {
    // header of the site
    introductionPage = IntroductionPage(
        title: Strings.besafebox_research_title,
        description: Strings.besafebox_research_comment,
        colorBackground: CustomColors.softened_grey,
        images: R.resource_images_besafebox_research,
        scaleCarousel: 0.75,
        useParentHeight: false,
        buttons: <NavigationButton>[
          // github page
          const NavigationButton.coloured(
            text: Strings.about_github,
            icon: R.resource_image_github,
            url: R.url_github_besafebox_research,
            backgroundColor: Colors.transparent,
            textColor: CustomColors.white,
            borderColor: CustomColors.white,
          ),
          // path BeSafeBox app
          NavigationButton.coloured(
            text: Strings.besafebox_app,
            icon: R.resource_image_android,
            url: R.paths_besafebox_app,
            internal: this.navigation,
            backgroundColor: Colors.transparent,
            textColor: CustomColors.white,
            borderColor: CustomColors.white,
          ),
        ]);
  }

  @override
  final Color colorBackground = CustomColors.softened_grey;

  /// [IntroductionPage] to represent illustrations of the fall
  late final IntroductionPage introductionPage;

  /// [stepByStepPage] reproduces the procedure taken during the research
  final StepByStepPage stepByStepPage = const StepByStepPage(
      Strings.besafebox_research_procedure,
      Strings.besafebox_research_procedure_titles,
      Strings.besafebox_research_procedure_description,
      CustomColors.soft_red);

  /// [featurePage] description of the dataset
  final FeaturePage featurePage = FeaturePage(
    cardCarrier: FeatureGenerator(
      images: R.resource_images_besafebox_dataset_icons,
      titles: Strings.besafebox_research_data_titles,
      descriptions: Strings.besafebox_research_data_description,
      textSize: 20,
      colorCard: CustomColors.soft_red,
      colorText: CustomColors.white,
    ),
    colorBackground: CustomColors.softened_grey,
    title: Strings.basafebox_research_data_title,
    colorTitle: CustomColors.white,
  );

  /// [optimizationResults] - SVM and RandomForest optimization
  final FeaturePage optimizationResults = FeaturePage(
    cardCarrier: FeatureGenerator(
      images: R.resource_images_besafebox_features_icons,
      titles: Strings.besafebox_research_feature_extraction_titles,
      descriptions: Strings.besafebox_research_feature_extraction_descriptions,
      textSize: 18,
      colorCard: CustomColors.soft_red,
      colorText: CustomColors.white,
    ),
    colorBackground: CustomColors.softened_grey,
    title: Strings.besafebox_research_model_results,
    colorTitle: CustomColors.white,
    siteSize: 750,
  );

  /// [previousWork] - description of the Tensorflow model
  final FeaturePage previousWork = FeaturePage(
    cardCarrier: FeatureGenerator(
      images: R.resource_images_besafebox_features_icons_previous,
      titles: Strings.besafebox_research_feature_extraction_titles_previous,
      descriptions:
          Strings.besafebox_research_feature_extraction_descriptions_previous,
      textSize: 18,
      colorCard: CustomColors.soft_red,
      colorText: CustomColors.white,
    ),
    colorBackground: CustomColors.softened_grey,
    title: Strings.besafebox_research_model_results_previous,
    colorTitle: CustomColors.white,
    siteSize: 750,
  );

  /// [getPagesDesktop] context and sizing information is from Scaffold
  /// builds widgets for the page
  /// in this case they are the same for the phone and desktop
  @override
  List<Widget> getPagesDesktop(
          BuildContext context, SizingInformation sizingInformation) =>
      <Widget>[
        introductionPage,
        stepByStepPage,
        featurePage,
        _getVisualisation(context, sizingInformation),
        optimizationResults,
        previousWork
      ];

  /// [getPagesPhone] context and sizing information is from Scaffold
  /// builds widgets for the page
  /// in this case they are the same for the phone and desktop
  @override
  List<Widget> getPagesPhone(
          BuildContext context, SizingInformation sizingInformation) =>
      <Widget>[
        introductionPage,
        stepByStepPage,
        featurePage,
        _getVisualisation(context, sizingInformation),
        optimizationResults,
        previousWork
      ];

  /// [_getVisualisation] feature extraction is demonstrated with chart
  /// the chart can be bigger by clicking on it -> fullscreen dialog
  DoubleWidgetPage _getVisualisation(
          BuildContext buildContext, SizingInformation sizingInformation) =>
      DoubleWidgetPage(
          title: Strings.besafebox_research_feature_extraction_title,
          row: true,
          widget1: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
            child: CardText(
                maxLines: sizingInformation.isMobile ? 25 : 15,
                height: sizingInformation.isDesktop
                    ? 300
                    : sizingInformation.isTablet
                        ? 350
                        : 500,
                title: null,
                description: Strings.besafebox_research_feature_extraction,
                colorCardBackground: CustomColors.soft_red,
                textColor: CustomColors.white,
                textSize: 20),
          ),
          widget2: Padding(
            padding: const EdgeInsets.all(32.0),
            // clickable image -> dialog to show it bigger
            child: getClickableImage(
                buildContext,
                R.resource_image_features,
                MediaQuery.of(buildContext).size.height * 0.5,
                CustomColors.white),
          ),
          titleColor: CustomColors.white,
          colorBackground: CustomColors.softened_grey);
}

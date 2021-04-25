import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:creative_motion_app/widgets/page_init.dart';
import 'package:creative_motion_app/widgets/pages/introduction_page.dart';
import 'package:creative_motion_app/widgets/views/buttons.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [EcgBiometry] describes Cinc paper
class EcgBiometry extends PageContent {
  /// [EcgBiometry] constructor with
  /// [navigation] callback to change internal site
  EcgBiometry(Function(BuildContext context, String url) navigation)
      : super(navigation) {
    introductionPage = IntroductionPage(
        title: Strings.ecg_biometry_title,
        description: Strings.ecg_biometry_description,
        colorBackground: CustomColors.pale_violet_red,
        images: R.resource_image_ecgbiometrics_images,
        useParentHeight: false,
        buttons: <NavigationButton>[
          // link to cinc paper
          const NavigationButton.coloured(
            text: Strings.ecg_biometry_cinc_button,
            icon: R.resource_image_ecg,
            url: R.url_cinc_ecg_biometry,
            backgroundColor: Colors.transparent,
            textColor: CustomColors.white,
            borderColor: CustomColors.white,
          ),
          // internal link to libraries
          NavigationButton.coloured(
            text: Strings.main_libraries,
            icon: R.resource_image_lib,
            url: R.paths_libs,
            internal: navigation,
            backgroundColor: Colors.transparent,
            textColor: CustomColors.white,
            borderColor: CustomColors.white,
          )
        ]);
  }

  /// [IntroductionPage] to show mobile app
  late final IntroductionPage introductionPage;

  @override
  final Color colorBackground = CustomColors.pale_violet_red;

  @override
  List<Widget> getPagesDesktop(
          BuildContext context, SizingInformation sizingInformation) =>
      <Widget>[
        introductionPage,
      ];

  @override
  List<Widget> getPagesPhone(
          BuildContext context, SizingInformation sizingInformation) =>
      <Widget>[
        introductionPage,
      ];
}

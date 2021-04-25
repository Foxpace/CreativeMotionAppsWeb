import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/personal_strings.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:creative_motion_app/widgets/cards/biocards.dart';
import 'package:creative_motion_app/widgets/views/buttons.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [CardsContent] created cards used in [BioPage]

/// job list - placed into timeline
final List<DescriptionCard> jobs = <DescriptionCard>[
  // cryptomood
  const DescriptionExpansionCard(
    sizingInformation: null,
    leftTitle: PersonalStrings.cryptomood_name,
    rightTitle: PersonalStrings.cryptomood_position,
    subTitle: PersonalStrings.cryptomood_date,
    description: PersonalStrings.cryptomood_description,
    buttons: <NavigationIcon>[
      // link to company
      NavigationIcon(PersonalStrings.cryptomood_name,
          R.resource_image_url_black, PersonalStrings.cryptomood_job_url, null)
    ],
    colorBackground: CustomColors.white,
    textSize: 18,
  ),
  // link to RECETOX
  const DescriptionExpansionCard(
    sizingInformation: null,
    leftTitle: PersonalStrings.recetox_name,
    rightTitle: PersonalStrings.recetox_position,
    subTitle: PersonalStrings.recetox_date,
    description: PersonalStrings.recetox_description,
    buttons: <NavigationIcon>[
      // link to company
      NavigationIcon(PersonalStrings.recetox_name, R.resource_image_url_black,
          PersonalStrings.recetox_job_url, null)
    ],
    colorBackground: CustomColors.white,
    textSize: 18,
  )
];

/// [education] obtained education - placed into timeline
final List<DescriptionList> education = <DescriptionList>[
  // master degree
  DescriptionList(
    leftTitle: PersonalStrings.education_university_master,
    rightTitle: PersonalStrings.education_university_BUT,
    subTitle: PersonalStrings.education_university_master_date,
    colorBackground: CustomColors.white,
    textSize: 18,
    // contend like field, faculty and etc
    content: List<Widget>.generate(
        PersonalStrings.education_fields.length,
        (int index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                height: 70,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                          child: Center(
                              child: Text(
                        PersonalStrings.education_fields[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ))),
                      Expanded(
                          child: Center(
                              child: Text(
                                  PersonalStrings
                                      .education_BUT_attributes[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18))))
                    ]),
              ),
            )),
  ),
  DescriptionList(
    // bachelor degree
    leftTitle: PersonalStrings.education_university_bachelor,
    rightTitle: PersonalStrings.education_university_BUT,
    subTitle: PersonalStrings.education_university_bachelor_date,
    colorBackground: CustomColors.white,
    textSize: 18,
    // contend like field, faculty and etc
    content: List<Widget>.generate(
        PersonalStrings.education_fields.length,
        (int index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                height: 70,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                          child: Center(
                              child: Text(
                        PersonalStrings.education_fields[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ))),
                      Expanded(
                          child: Center(
                              child: Text(
                                  PersonalStrings
                                      .education_BUT_attributes[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18))))
                    ]),
              ),
            )),
  ),
  const DescriptionList(
      // middle school
      leftTitle: PersonalStrings.education_grammar_school,
      rightTitle: '',
      subTitle: PersonalStrings.education_grammar_school_date,
      colorBackground: CustomColors.white,
      textSize: 18,
      content: <Widget>[
        Text(
          PersonalStrings.education_grammar_school_description,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        )
      ]),
];

/// [getPythonCard] with navigation callback to change internal site
/// links to all projects and short description
DescriptionCard getPythonCard(
        SizingInformation sizingInformation, Function navigationCallback) =>
    DescriptionExpansionCard(
      width: 500,
      expansion: true,
      sizingInformation: sizingInformation,
      leftTitle: PersonalStrings.skills_python_title,
      rightTitle: PersonalStrings.skills_python_usage,
      subTitle: PersonalStrings.skills_python_subtitle,
      description: PersonalStrings.skills_python_description,
      buttons: <Widget>[
        // basafebox research
        NavigationButton(
          text: Strings.besafebox_title,
          icon: R.resource_image_fall_black,
          url: R.paths_besafebox_science,
          internal: navigationCallback,
          textColor: CustomColors.black,
          borderColor: CustomColors.black,
        ),
        // ecg biometry
        NavigationButton(
          text: Strings.ecg_biometry_title,
          icon: R.resource_image_ecg,
          url: R.paths_ecg_biometrics_science,
          internal: navigationCallback,
          textColor: CustomColors.white,
          borderColor: CustomColors.red,
          backgroundColor: CustomColors.red,
        ),
        // signal screen
        NavigationButton(
          text: Strings.signal_screen_title,
          icon: R.resource_image_ecg,
          url: R.paths_libs,
          internal: navigationCallback,
          textColor: CustomColors.white,
          borderColor: CustomColors.blue,
          backgroundColor: CustomColors.blue,
        )
      ],
      colorBackground: CustomColors.white,
      textSize: 18,
    );

/// [getAndroidCard] with callback function to switch sites
/// projects build for the android
DescriptionCard getAndroidCard(
        SizingInformation sizingInformation, Function navigationCallback) =>
    DescriptionExpansionCard(
      width: 500,
      expansion: true,
      sizingInformation: sizingInformation,
      leftTitle: PersonalStrings.skills_android_title,
      rightTitle: PersonalStrings.skills_android_usage,
      subTitle: PersonalStrings.skills_android_subtitle,
      description: PersonalStrings.skills_android_description,
      buttons: <NavigationButton>[
        // BeSafeBox app
        NavigationButton(
          text: Strings.besafebox_title,
          icon: R.resource_image_fall_black,
          url: R.paths_besafebox_app,
          internal: navigationCallback,
          textColor: CustomColors.black,
          borderColor: CustomColors.black,
        ),
        // SensorBox
        NavigationButton(
          text: Strings.sensorbox_title,
          icon: R.resource_image_sensorbox_icon,
          url: R.paths_sensorbox,
          internal: navigationCallback,
          textColor: CustomColors.white,
          borderColor: CustomColors.blue,
          backgroundColor: CustomColors.blue,
        ),
        // EcgBiometry
        NavigationButton(
          text: Strings.ecg_biometry_title,
          icon: R.resource_image_ecg,
          url: R.paths_ecg_biometrics_science,
          internal: navigationCallback,
          textColor: CustomColors.white,
          borderColor: CustomColors.red,
          backgroundColor: CustomColors.red,
        ),
        // SensorTemplate
        NavigationButton(
          text: Strings.sensortemplate_title,
          icon: R.resource_image_android,
          url: R.paths_besafebox_app,
          internal: navigationCallback,
          textColor: CustomColors.white,
          borderColor: CustomColors.black,
          backgroundColor: CustomColors.black,
        ),
        // EcgDetectors
        NavigationButton(
          text: Strings.kotlin_ecg_detectors_title,
          icon: R.resource_image_ecg,
          url: R.paths_libs,
          internal: navigationCallback,
          textColor: CustomColors.white,
          borderColor: CustomColors.kotlin_orange,
          backgroundColor: CustomColors.kotlin_orange,
        )
      ],
      colorBackground: CustomColors.white,
      textSize: 18,
    );

/// [getOtherLanguages] - other languages used occasionally
/// flutter, c++, R, ...
DescriptionCard getOtherLanguages(
        SizingInformation sizingInformation, Function navigationCallback) =>
    DescriptionExpansionCard(
      width: 500,
      sizingInformation: sizingInformation,
      expansion: true,
      leftTitle: PersonalStrings.skills_other_title,
      rightTitle: PersonalStrings.skills_other_usage,
      subTitle: PersonalStrings.skills_other_subtitle,
      description: PersonalStrings.skills_other_description,
      buttons: <NavigationButton>[
        // BeSafeBox - C++
        NavigationButton(
          text: Strings.besafebox_title,
          icon: R.resource_image_fall_black,
          url: R.paths_besafebox_app,
          internal: navigationCallback,
          textColor: CustomColors.black,
          borderColor: CustomColors.black,
        ),
        // this site repository
        NavigationButton(
          text: Strings.creative_motion_apps_github_shortcut,
          icon: R.resource_image_flutter,
          url: R.url_github_creative_motion_web,
          internal: navigationCallback,
          textColor: CustomColors.white,
          borderColor: CustomColors.blue,
          backgroundColor: CustomColors.blue,
        ),
        // c++ library
        NavigationButton(
          text: Strings.c_ecg_detectors_title,
          icon: R.resource_image_ecg,
          url: R.paths_libs,
          internal: navigationCallback,
          textColor: CustomColors.white,
          borderColor: CustomColors.c_brown,
          backgroundColor: CustomColors.c_brown,
        )
      ],
      colorBackground: CustomColors.white,
      textSize: 18,
    );

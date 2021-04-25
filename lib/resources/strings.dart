
// ignore_for_file: public_member_api_docs
// ignore_for_file: constant_identifier_names
/// [Strings] stores all the texts used in the site
class Strings {
  static const String bullet_point = "•";

  // home page
  static const String creative_motion_apps_title = "Creative Motion Apps";
  static const String creative_motion_apps_version = "1.0.0";
  static const String creative_motion_apps_subtitle = "Smarter companion"
      " with you";
  static const String creative_motion_apps_text =
      "From data aggregation, pre-processing, "
      "to modeling, visualisation and full implementations to "
      "smartphones and wearables.";
  static const String creative_motion_apps_github = "Website GitHub (Flutter)";
  static const String creative_motion_apps_github_shortcut = "Flutter web";
  static const String creative_motion_apps_resources = "Resources";

  static const String creative_motion_apps_license =
      "Content of the web is licensed under: Creative Commons Attribution "
      "Share Alike 4.0 International\n\n"
      "Code of the creativemotion.app is licensed under GNU license. "
      "Copyright (C) 2021 Tomáš Repčík "
      "This program is free software: you can redistribute it and/or modify "
      "it under the terms of the GNU General Public License as published by "
      "the Free Software Foundation, either version 3 of the License, or "
      "(at your option) any later version. "
      "This program is distributed in the hope that it will be useful, "
      "but WITHOUT ANY WARRANTY; without even the implied warranty of "
      "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the "
      "GNU General Public License for more details. "
      "You should have received a copy of the GNU General Public License "
      "along with this program.  If not, see https://www.gnu.org/licenses/.";

  static const List<String> creative_motion_licenses = <String>[
    "Sitting icon from: https://www.freepik.com",
    "Lazy icon from: https://icons8.com/",
    "SVM by sachin modgekar from the Noun Project",
    "Random Forest by Knut M. Synstad from the Noun Project"
  ];

  // apps

  // sensorbox
  static const String sensorbox_title = "SensorBox";
  static const String sensorbox_comment = "Store sensor data";
  static const String sensorbox_date = "2018 - now";
  static const String sensorbox_description =
      "SensorBox provides a solution to record all sensors contained in a"
      " Android smartphone or a Wear Os device. "
      "All outputs are stored in CSV files with raw values. "
      "Preview of every sensor is enriched with basic information. "
      "A measurement can be started with custom settings, annotations "
      "and alarms. "
      "The gathered data can be used for development of apps, which use the "
      "sensors.";

  static const List<String> sensorbox_features_titles = <String>[
    "Every sensor",
    "Record to .csv",
    "Get parameters",
    "Timing",
    "Activity recognition",
    "Custom annotations",
    "Compatibility",
    "Wear Os"
  ];

  static const List<String> sensorbox_features = <String>[
    "The application is compatible with all sensors available on a phone",
    "All sensor outputs are formatted to .csv files to your local storage",
    "Get all parameters about your sensors. Info can be found in a extra.json ",
    "Set a countdown for every measurement from seconds to hours",
    "All changes of motion can be detected by Android motion detection",
    "Annotate important moments with a custom text during the measurement",
    "The application compatible from Android KitKat to Android 11 ",
    "Wear Os compatibility with support of local storage (Beta)"
  ];

  static const String next_tabs = "For more details go to next tabs.";

  // besafebox
  static const String besafebox_app = "BeSafeBox app";
  static const String besafebox_title = "BeSafeBox";
  static const String besafebox_comment = "Fall detection app";
  static const String besafebox_date = "2018 - 2020";
  static const String besafebox_description =
      "BeSafeBox is fall detection app for a Android phone. "
      "The app uses an accelerometer and our algorithm to determine"
      " collapse of the person. "
      "After the detection, the phone will try to call its owner / attract "
      "someone from a close surrounding. "
      "However, if no one is available, the app sends a SMS with a location"
      " after certain amount of time. "
      "The app is not available on Google Play, due to unpredictable behaviour "
      "caused by manufacturers battery saving routines.";

  static const String besafebox_dialog_title = "Attention please";
  static const String besafebox_dialog_description =
      "BeSafeBox is an experimental application that is not intended for "
      "use in a real conditions. "
      "The creator is not responsible for any malfunction of the application "
      "or for the damage caused to health. "
      "Use is at your own risk.";
  static const String besafebox_dialog_button = "Download";

  static const List<String> besafebox_features_titles = <String>[
    "Purpose",
    "Accuracy",
    "Battery",
    "Compatibility",
    "Restricted activity",
    "For elderly",
    "Alarm",
    "Call for help",
  ];
  static const List<String> besafebox_features = <String>[
    "This mobile application aims to provide a solution for a collapse of "
        "person in any situation",
    "The actual accuracy on our data is 90.5 %. For fall the precision is "
        "78 % and sensitivity 90.5 % in average",
    "The algorithm is constructed to be as lightweight as possible. "
        "The Android activity recognition can be employed "
        "to reduce consumption.",
    "The app experiences problems with higher versions of Android due "
        "to more restrictions for the background operations. Otherwise "
        "compatible with 4.4.4 - 11.",
    "The app works only during time period, when the phone is "
        "placed in a pocket",
    "After the initial setup, the app is like an on/off switch. One button"
        " does everything",
    "Prior to calling for a help, the app tries to attract someone from "
        "surrounding for the help / user can turn off the alarm",
    "After 60s of no response, the phone sends the SMS message with "
        "your location to the specified contact",
  ];

  static const String besafebox_google_play = "Why not on Google Play?";
  static const String besafebox_battery_title =
      "Reason: manufacturer's battery saving routines";

  static const String besafebox_battery_description =
      "Android has its own battery saving routine, which saves your "
      "battery against a drainage. "
      "Apps can add themselves to a whitelist, so they can work properly "
      "all the time, independently on the battery usage and a state. "
      "The manufactures implement their own routines, which cannot be "
      "controlled by user or adjustments are limited. "
      "This routines kill the apps on the background in a periodic "
      "manner and this is the main reason, why BeSafeBox cannot work properly. "
      "BeSafeBox is killed / put to sleep at any point of time and the "
      "detection cannot be properly executed when needed, so safety of"
      " people is not guaranteed. ";
  static const String besafebox_more_information = "More information";
  static const String besafebox_information_description =
      "You can test / check your phone at dontkillmyapp.com, if it has "
      "mechanics for battery saving. "
      "You can find there ways how to minimize influence of routines "
      "on the apps for different vendors.";

  static const List<String> resource_besafebox_media_subtitle = <String>[
    "TV - night news",
    "School portal",
    "Web news / newspapers",
    "Bachelor thesis",
    "FEKT conference -\nwinner in Biomedical category"
  ];

  // sensortemplate

  static const String sensortemplate_title = "SensorTemplate";
  static const String sensortemplate_description =
      "SensorTemplate provides examples of basic Android functions, "
      "which can be used "
      "in a research. Also it has abstract classes for different "
      "Python machine learning "
      "from scikit-learn and Tensorflow neural network implementation. "
      "The app is programmed in Kotlin, "
      "but the structure resembles original BeSafeBox.";

  // besafebox - research
  static const String besafebox_research_title = "BeSafeBox - research";
  static const String besafebox_research_comment =
      "BeSafeBox is based on a data collection with help of the "
      "participants, who "
      "were willing to put their bodies through some pain to obtain situations "
      "similar to the collapse. They were sitting, laying, "
      "walking and falling, so "
      "the model could be created for the fall detection."
      " This site describes how "
      "and which steps were made to make it real. For more"
      " technical information, "
      "it is recommended visit github page and open Research.ipynb.";
  static const String basafebox_research_data_title = "Final dataset";
  static const List<String> besafebox_research_data_titles = <String>[
    "Participants",
    "Phones",
    "Gathering app",
    "Total measurements",
    "Falls",
    "Sits",
    "Lays",
    "Walks"
  ];
  static const List<String> besafebox_research_data_description = <String>[
    "23",
    "Huawei P9\nSony Xperia Z5 Compact",
    "Gathering app - custom app SensorBox. 10s measurements "
        "with a phone in a pocket of a trousers.",
    "3260",
    "840",
    "1071",
    "551",
    "667"
  ];

  static const String besafebox_research_procedure = "Research - procedure";
  static const List<String> besafebox_research_procedure_titles = <String>[
    "Data aggregation",
    "Data validation",
    "Event and feature extraction",
    "Data cleaning",
    "Creation of the models",
    "Evaluation"
  ];
  static const List<String> besafebox_research_procedure_description = <String>[
    "Events similar to the fall were simulated by participants"
        " in controlled environment. "
        "The performed motions like sitting, falling, walking and laying down "
        "are the most frequent actions, which people do in a daily life. "
        "Every measurement has 10s, during which the participant"
        " did the required "
        "action. The phone was placed in a pocket of their trousers.",
    "If any of the conditions were not meet, the measurement "
        "was expelled from the research. The measurement"
        " must have max value above the 3g threshold. "
        "Must have at least 10 seconds. No significant "
        "gap between the acceleration"
        " samples. All the event extraction and calculation of "
        "parameters has to be calculated without errors.",
    "The event of interest is located around the highest magnitude "
        "of the acceleration signal. The algorithm tries to find a period of "
        "free fall before the main impact (max. 0.3s). The end of the"
        " event is located at last value above 1.5g (max. 0.7s). "
        "From the cut part of the signal the 19 features are calculated "
        "of statistical character or engineered features for the fall.",
    "The extracted features are cleaned by customized IQR rule. All the "
        "values above or under the IQR thresholds are compared with closest "
        "neighbours from the dataset of the same type. If there are more "
        "similar points, the value is unchanged. The values are "
        "normalized between 0 - 1.",
    "For the first attempt to create model, the Tensorflow feedforward"
        " network was created, mainly due to the ease of "
        "implementation for Android devices. "
        "However, with application of feature selection (leave-one out"
        " method) and simpler methods from "
        "sklearn like SVM / RandomForest, better results were obtained. "
        "The sklearn models were optimized with Bayesian optimization "
        "algorithm.",
    "The participants also recorded almost 300h of accelerations records "
        "(with no fall event), on which the false positivity of the"
        " detector has been tested.",
  ];

  static const String besafebox_research_feature_extraction_title =
      "Feature extraction";
  static const String besafebox_research_feature_extraction =
      "All the parameters, which are visible at the chart are calculated "
      "from main event in every measurement. "
      "As we can see at the next picture, distributions between the falls"
      " and other activities varies. "
      "The most dominant is change of angle with cosine function, which is "
      "mainly due to the character of the event. "
      "If the user falls, the change can be higher than 90°. Another essential "
      "parameter picked by the feature selection are "
      "1g crossings, which are caused by another impacts of different parts of "
      "a body. "
      "This waves are transmitted through whole body and cause another "
      "changes in the acceleration. The immediate first impact has "
      "the largest amplitude with quick onset, so the kurtosis and average"
      " are also taken into account. The last feature is the free fall index "
      "which describes the first decrease of amplitude before the first onset.";

  static const String besafebox_research_model_results = "Model results";
  static const List<String> besafebox_research_feature_extraction_titles =
      <String>[
    "SVM (dataset)",
    "RandomForest (dataset)",
    "Real-life data",
    "False positivity"
  ];
  static const List<String> besafebox_research_feature_extraction_descriptions =
      <String>[
    "Accuracy: 90.42%\n Precision: 77%\n Sensitivity: 92%\n Size: 94kB",
    "Accuracy: 90.58%\n Precision: 79%\n Sensitivity: 89%\n Size: 580kB",
    "Almost 300h with indications: 4281\n No fall - active life style",
    "SVM: 1.94%\nRandomForest: 1.12%"
  ];

  static const String besafebox_research_model_results_previous =
      "Previous work";
  static const List<String>
      besafebox_research_feature_extraction_titles_previous = <String>[
    "Tensorflow network",
    "Performance",
    "Real-life data - offline",
    "Real use of the app"
  ];
  static const List<String>
      besafebox_research_feature_extraction_descriptions_previous = <String>[
    "Mainly due to the ease implementation of the neural networks for Android. "
        "The implementation was also programmed in pure C/C++.",
    "Accuracy: 86%\nSensitivity: 76%\nSize: 17kB",
    "3153 indications (with previous method):\n4.44% false positivity",
    "540h of casual usage by participants resulted in 13151 indications. "
        "94 false alarms - 0.007%"
  ];

  // ECG biometry
  static const String ecg_biometry_title = "ECG biometry";
  static const String ecg_biometry_comment = "Heart to verify";
  static const String ecg_biometry_date = "2020 - now";
  static const String ecg_biometry_description =
      "Electrocardiography (ECG) measures an electric activity of"
      " heart, which is unique for every person. "
      "The uniqueness is secured with various morphological and "
      "physiological states of each heart. "
      "This proposes challenge to create a new biometric approach. "
      "The creation of the signal artificially is tricky. "
      "Falsification requires direct contact and specific hardware. "
      "During studies at BUT, a research was executed with my "
      "direct participation, which resulted in "
      "publication at Computing in Cardiology 2020 conference. "
      "The aim of research was to explore various approaches for "
      "ECG verification. "
      "The algorithm was developed further during the diploma thesis."
      " Acknowledgements also belongs to CARDIOID a.s. . "
      "Some tools created during the study were released at GitHub like "
      "1D neural network visualisations algorithms or ECG detectors "
      "programmed for Kotlin or C/C++. "
      "They can be found in the library tab.";
  static const String ecg_biometry_cinc_button = "Cinc paper";

  // not found

  static const String page_not_found = "Error 404 - page not found";
  static const String page_loading = "Loading";

  // home page - buttons
  static const String main_libraries = "Libraries";
  static const String main_blog = "Blog";
  static const String main_bio = "Resume";
  static const String main_contact = "In case of problems with apps use:";
  static const String main_mail_support = "support@creativemotion.app";

  // links
  static const String about_app = "About app";
  static const String about_research = "About research";
  static const String about_google_play = "Google play";
  static const String about_github = "GitHub";
  static const String about_download = "Download .apk";

  // libraries
  static const String signal_screen_title = "SignalScreen";
  static const String signal_screen_subtitle =
      "Visual interpretation of 1D neural networks";
  static const String signal_screen_description =
      "Visualisation of the neural networks can unfold inner "
      "dependencies of the "
      "network, which can lead for more intuitive view, which part "
      "of the input "
      "is essential towards the required output.";
  static const String signal_screen_features =
      "• Compatible with Tensorflow 2.x\n"
      "• Grad-CAM, Occlusion sensitivity, Saliency Maps\n"
      "• Matplotlib gradient chart implemented";

  static const String c_ecg_detectors_title = "Cpp ECG detectors";
  static const String c_ecg_detectors_subtitle = "QRS detectors in C/C++";
  static const String c_ecg_detectors_description =
      "Basic QRS detectors implemented in C/C++ with usage "
      "of traditional signal processing technique. "
      "Programmed to work in real-time.";
  static const String c_ecg_detectors_features = "• Online detectors\n"
      "• Pan-Tompkins and Engelse-Zeelenberg detectors\n"
      "• Easy implementation - detector object + one process method";

  static const String kotlin_ecg_detectors_title = "Kotlin ECG detectors";
  static const String kotlin_ecg_detectors_subtitle = "QRS detectors in Kotlin";
  static const String kotlin_ecg_detectors_description =
      "Basic QRS detectors in Kotlin "
      "for offline and online processing of ECG signal.";
  static const String kotlin_ecg_detectors_features =
      "• Online / offline detection\n"
      "• 6 available detectors\n"
      "• Hamilton, Pan-Tompkins, Engelse-Zeelenberg, Christov, "
      "2 moving averages,"
      " Matched detectors ";

  static const String features = "Features";
  static const String visit_web = "Visit web";
  static const String in_media = "In media (in SK/CZ)";

  // bio
  static const String bio_about_me = "About me";
  static const String bio_work_experience = "Work Experiences";
  static const String bio_skills_and_portfolio = "Skills & Portfolio";
  static const List<String> bio_about_me_titles = <String>[
    "Age",
    "Nationality",
    "Languages",
    "Personal qualities",
    "Hobbies",
    "Sports",
    "Music",
    "Favourite quote"
  ];
  static const String bio_education = "Education";
  static const List<String> bio_education_schools = <String>[
    "Master's degree\n2019-2021",
    "Bachelor's degree\n2016-2019",
    "Grammar School\n2012-2016"
  ];
  static const String bio_programming_skills = "Programming languages";
  static const String bio_most_used = "Most used languages:";
  static const String bio_linkedin = "LinkedIn";
  static const String bio_github = "Github";
  static const String bio_portfolio = "Portfolio";
  static const String bio_more_info = "More info";

  static const String dialog_dismiss = "Dismiss";
}

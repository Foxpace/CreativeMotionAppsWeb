/// [R] is main resource file, which stores all the paths and images
// ignore_for_file: public_member_api_docs
// ignore_for_file: constant_identifier_names
class R {
  // pathing
  static const String paths_error = '/error';
  static const String paths_root = '/';
  static const String paths_apps = '/apps';
  static const String paths_libs = '/libs';
  static const String paths_blog = '/blog';
  static const String paths_bio = '/bio';
  static const String paths_sensorbox = '/SensorBox';
  static const String paths_besafebox_app = '/BeSafeBoxApp';
  static const String paths_besafebox_science = '/BeSafeBoxScience';
  static const String paths_ecg_biometrics_app = '/EcgBiometricsApp';
  static const String paths_ecg_biometrics_science = '/EcgBiometricsScience';
  static const String paths_sensortemplate = '/SensorTemplate';
  static const String paths_ecgdetector = '/EcgDetectors';
  static const String paths_nnvisual = '/NNVisual';

  static const List<String> pathsList = <String>[
    R.paths_root,
    R.paths_apps,
    R.paths_libs,
    R.paths_blog,
    R.paths_bio,
    R.paths_sensorbox,
    R.paths_besafebox_app,
    paths_besafebox_science,
    R.paths_ecg_biometrics_app,
    paths_ecg_biometrics_science,
    R.paths_sensortemplate,
    R.paths_ecgdetector,
    R.paths_nnvisual
  ];

  // URLs
  static const String url_flutter_dev = "http://flutter.dev";
  static const String url_google_play_sensorbox =
      "https://play.google.com/store/apps/details?id=motionapps.sensorbox";
  static const String url_github_sensorbox = "https://github.com/Foxpace/SensorBox";
  static const String url_github_signal_screen =
      "https://github.com/Foxpace/SignalScreen";
  static const String url_github_cpp_ecg_detectors =
      "https://github.com/Foxpace/Cpp_Ecg_Detectors";
  static const String url_github_kotlin_ecg_detectors =
      "https://github.com/Foxpace/Kotlin-Ecg-Detectors";
  static const String url_github_besafebox_app = "https://github.com/Foxpace/BeSafeBox_Android_app";
  static const String url_github_besafebox_research = "https://github.com/Foxpace/BeSafeBox_research";
  static const String url_besafebox_apk_download = "https://github.com/Foxpace/BeSafeBox_Android_app/releases/download/v0.1.0/BeSafeBox.apk";
  static const String url_cinc_ecg_biometry =
      "http://www.cinc.org/archives/2020/pdf/CinC2020-321.pdf";
  static const String url_dontkillmyapp = "https://dontkillmyapp.com/";
  static const String url_github_sensortemplate = "https://github.com/Foxpace/SensorTemplate";
  static const String url_github_creative_motion_web = "https://github.com/Foxpace/CreativeMotionAppsWeb";

  // fonts
  static const String font_encoded_sans_condensed = "EncodeSansCondensed";

  // images
  static const String resource_image_header = "assets/images/header.png";
  static const String resource_image_header_icon = "assets/icons/header_icon.png";
  static const String resource_image_sensorbox = "assets/images/SensorBox.png";
  static const List<String> resource_image_sensorbox_images = <String>[
    resource_image_sensorbox,
    "assets/images/SensorBoxAdvanced.png",
    "assets/images/SensorBoxInfo.png",
    "assets/images/SensorBoxRecord.png",
    "assets/images/SensorBoxWear.png",
    "assets/images/SensorBoxWearShow.png"
  ];

  static const List<String> resource_image_sensorbox_features = <String>[
    resource_image_sensor_xlarge,
    resource_image_table_xlarge,
    resource_image_info_xlarge,
    resource_image_timer_xlarge,
    resource_image_figure_xlarge,
    resource_image_annots_xlarge,
    resource_image_android_xlarge,
    resource_image_watch_xlarge
  ];

  static const String resource_image_besafebox = "assets/images/BeSafeBox.png";
  static const List<String> resource_image_besafebox_images = <String>[
    resource_image_besafebox,
    "assets/images/BeSafeBox2.png",
    "assets/images/BeSafeBox3.png"
  ];

  static const String resource_image_ecgbiometrics = "assets/images/EcgBiometrics.png";
  static const List<String> resource_image_ecgbiometrics_images = <String>[
    resource_image_ecgbiometrics,
    "assets/images/EcgBiometrics2.png"
  ];
  static const String resource_image_ecg_r_wave = "assets/images/EcgrWave.png";
  static const String resource_image_ecg_gradient = "assets/images/EcgGradient.png";

  // SensorTemplate
  static const String resource_image_sensortemplate = "assets/images/SensorTemplate.png";

  // icons
  static const String resource_image_about =             "assets/icons/about.png";
  static const String resource_image_lib =               "assets/icons/lib.png";
  static const String resource_image_lib_blue =          "assets/icons/lib_blue.png";
  static const String resource_image_info =              "assets/icons/info.png";
  static const String resource_image_c =                 "assets/icons/c.png";
  static const String resource_image_github =            "assets/icons/github.png";
  static const String resource_image_github_black =      "assets/icons/github_black.png";
  static const String resource_image_github_large =      "assets/icons/github_large.png";
  static const String resource_image_download =          "assets/icons/download.png";
  static const String resource_image_google_play =       "assets/icons/google_play.png";
  static const String resource_image_google_play_green = "assets/icons/google_play_green.png";
  static const String resource_image_google_play_large = "assets/icons/google_play_large.png";
  static const String resource_image_java =              "assets/icons/java.png";
  static const String resource_image_kotlin =            "assets/icons/kotlin.png";
  static const String resource_image_phone =             "assets/icons/phone.png";
  static const String resource_image_python =            "assets/icons/python.png";
  static const String resource_image_research =          "assets/icons/research.png";
  static const String resource_image_research_black =    "assets/icons/research_black.png";
  static const String resource_image_research_large =    "assets/icons/research_large.png";
  static const String resource_image_android =           "assets/icons/android.png";
  static const String resource_image_android_large =     "assets/icons/android_large.png";
  static const String resource_image_url =               "assets/icons/web.png";
  static const String resource_image_url_black =         "assets/icons/web_black.png";
  static const String resource_image_ecg =               "assets/icons/ecg.png";
  static const String resource_image_ecg_black =         "assets/icons/ecg_black.png";
  static const String resource_image_fall =              "assets/icons/fall.png";
  static const String resource_image_fall_black =        "assets/icons/fall_black.png";
  static const String resource_image_flutter=            "assets/icons/flutter.png";
  static const String resource_image_flutter_blue =      "assets/icons/flutter_blue.png";
  static const String resource_image_sensorbox_icon =    "assets/icons/sensorbox_icon.png";
  static const String resource_image_linkedin_square =   "assets/icons/linkedin_square.png";
  static const String resource_image_github_square =     "assets/icons/github_square.png";
  static const String resource_image_licenses =          "assets/icons/icon_license.png";

  // sensorbox
  static const String resource_image_android_xlarge = "assets/icons/android_xlarge.png";
  static const String resource_image_annots_xlarge =  "assets/icons/annots_xlarge.png";
  static const String resource_image_figure_xlarge =  "assets/icons/figure_xlarge.png";
  static const String resource_image_info_xlarge =    "assets/icons/info_xlarge.png";
  static const String resource_image_sensor_xlarge =  "assets/icons/sensor_xlarge.png";
  static const String resource_image_table_xlarge =   "assets/icons/table_xlarge.png";
  static const String resource_image_timer_xlarge =   "assets/icons/timer_xlarge.png";
  static const String resource_image_watch_xlarge =   "assets/icons/watch_xlarge.png";

  // besafebox app
  static const List<String> resource_image_besafebox_features = <String>[
    resource_image_fall_xlarge,
    resource_image_accuracy_xlarge,
    resource_image_battery_xlarge,
    resource_image_android_xlarge,
    resource_image_trousers_xlarge,
    resource_image_elderly_xlarge,
    resource_image_vibration_xlarge,
    resource_image_sms_xlarge,
  ];

  static const String resource_image_accuracy_xlarge =  "assets/icons/accuracy_xlarge.png";
  static const String resource_image_battery_xlarge =   "assets/icons/battery_xlarge.png";
  static const String resource_image_elderly_xlarge =   "assets/icons/elderly_xlarge.png";
  static const String resource_image_fall_xlarge =      "assets/icons/fall_xlarge.png";
  static const String resource_image_location_xlarge =  "assets/icons/location_xlarge.png";
  static const String resource_image_sms_xlarge =       "assets/icons/sms_xlarge.png";
  static const String resource_image_vibration_xlarge = "assets/icons/vibration_xlarge.png";
  static const String resource_image_trousers_xlarge =  "assets/icons/trousers_xlarge.png";

  static const List<String> resource_image_besafebox_media = <String>[
    "assets/images/prima.png",
    "assets/images/zvut.png",
    "assets/images/novinky_cz.png",
    "assets/images/dspace_logo.png",
    "assets/images/eeict.png"
  ];
  static const List<String> resource_urls_besafebox_media = <String>[
    "https://prima.iprima.cz/zpravodajstvi/video-nova-aplikace-do-chytrych-telefonu-zacne-pomahat-seniorum",
    "https://zvut.cz/napady-objevy/napady-a-objevy-f38103/student-fekt-vut-navrhl-mobilni-aplikaci-pro-seniory-pomuze-jim-pokud-upadnou-d186727",
    "https://www.novinky.cz/veda-skoly/clanek/mobilni-aplikace-pomuze-seniorum-kdyz-upadnou-40285850",
    "http://hdl.handle.net/11012/173624",
    "https://www.fekt.vut.cz/conf/EEICT/archiv/sborniky/EEICT_2019_sbornik.pdf"

  ];

  // besafebox research
  static const List<String> resource_images_besafebox_research = <String>[
    "assets/images/besafebox_research_1.png",
    "assets/images/besafebox_research_2.png",
    "assets/images/besafebox_research_3.png",
    "assets/images/besafebox_research_4.png",
    "assets/images/besafebox_research_5.png",
    "assets/images/besafebox_research_6.png",
  ];

  static const List<String> resource_images_besafebox_dataset_icons = <String>[
    "assets/icons/people_white_xlarge.png",
    resource_image_android_xlarge,
    "assets/icons/sensorbox_icon_xlarge.png",
    "assets/icons/database_white_xlarge.png",
    resource_image_fall_xlarge,
    "assets/icons/sitting_xlarge.png",
    "assets/icons/laying_white_xlarge.png",
    "assets/icons/walking_white_xlarge.png"
  ];

  static const List<String> resource_images_besafebox_features_icons =
  <String>[
    "assets/icons/svm_white_xlarge.png",
    "assets/icons/random_forest_white_xlarge.png",
    "assets/icons/walking_white_xlarge.png",
    "assets/icons/cross_white_xlarge.png",
  ];

  static const List<String> resource_images_besafebox_features_icons_previous =
  <String>[
    "assets/icons/neural_network_white_xlarge.png",
    resource_image_accuracy_xlarge,
    "assets/icons/walking_white_xlarge.png",
    "assets/icons/people_white_xlarge.png",
  ];

  static const String resource_image_features = "assets/images/features.png";


  // bio
  static const String resource_image_me = "assets/images/personal/me.png";

  static const String resource_image_calendar =      "assets/icons/calendar_white_xlarge.png";
  static const String resource_image_slovak =        "assets/icons/slovak_symbol.png";
  static const String resource_image_speaking =      "assets/icons/speaking_bubble_xlarge.png";
  static const String resource_image_personality =   "assets/icons/personality_white_xlarge.png";
  static const String resource_image_relax =         "assets/icons/relax_white_xlarge.png";
  static const String resource_image_dumbbell =      "assets/icons/dumbbell_white_xlarge.png";
  static const String resource_image_music =         "assets/icons/music_white_xlarge.png";
  static const String resource_image_falling_apple = "assets/icons/falling_apple_white_xlarge.png";

  static const List<String> resource_bio_images = <String>[
    resource_image_calendar,
    resource_image_slovak,
    resource_image_speaking,
    resource_image_personality,
    resource_image_relax,
    resource_image_dumbbell,
    resource_image_music,
    resource_image_falling_apple
  ];

}

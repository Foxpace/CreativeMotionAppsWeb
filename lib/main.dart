import 'package:creative_motion_app/apps/ecgid/ecgid_page.dart';
import 'package:creative_motion_app/libs/ecgdetectors/ecg_detectors_page.dart';
import 'package:creative_motion_app/libs/nnvisual/NN_visual_page.dart';
import 'package:creative_motion_app/resources/R.dart';
import 'package:flutter/material.dart';

import 'about/about_page.dart';
import 'apps/apps_page.dart';
import 'apps/besafebox/besafebox_page.dart';
import 'apps/sensorbox/sensorbox_page.dart';
import 'apps/sensortemplate/sensortemplate_page.dart';
import 'blog/blog_page.dart';
import 'home/home_page.dart';
import 'libs/libs_page.dart';

void main() {
  runApp(CreativeMotionWeb());
}

class CreativeMotionWeb extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Creative Motion Apps',
      initialRoute: R.paths_root,
      routes: {
        R.paths_root: (context) => Home(),
        R.paths_apps: (context) => AppsPage(),
        R.paths_libs: (context) => LibsPage(),
        R.paths_blog: (context) => BlogPage(),
        R.paths_about: (context) => AboutPage(),
        R.paths_sensorbox: (context) => SensorBoxPage(),
        R.paths_besafebox: (context) => BeSafeBox(),
        R.paths_ecgid: (context) => EcgID(),
        R.paths_sensortemplate: (context) => SensorTemplatePage(),
        R.paths_ecgdetector: (context) => EcgDetectors(),
        R.paths_nnvisual: (context) => NNVisual(),
      },
    );
  }
}


import 'package:creative_motion_app/navigation/url_navigator.dart';
import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(CreativeMotionWeb());
}

/// main app class
class CreativeMotionWeb extends StatelessWidget {
  // This widget is the root of application.
  @override
  Widget build(BuildContext context) =>
      MaterialApp.router(
        routerDelegate: WebUrlDelegate(),
        routeInformationParser: WebUrlParser(),
        title: Strings.creative_motion_apps_title,
        theme: ThemeData(
            highlightColor: CustomColors.white,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.white,
              selectionColor: Colors.redAccent,
              selectionHandleColor: Colors.redAccent,
            ),
            fontFamily: R.font_encoded_sans_condensed
        ),
        debugShowCheckedModeBanner: false,
      );
}



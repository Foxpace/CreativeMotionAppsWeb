import 'package:creative_motion_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'app_container.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {

      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return getDesktopVersion();
      } else {
        return getPhoneVersion();
      }
    });
  }

  Widget getDesktopVersion() {

    List<MaterialColor> c = [Colors.red, Colors.green, Colors.blue];
    List<String> titles = [
      "SensorBox",
      "SensorBox",
      "SensorBox",
    ];

    List<String> paths = [
      "assets/images/SensorBox.png",
      "assets/images/SensorBox.png",
      "assets/images/SensorBox.png",
    ];

    List<String> comments = [
      "Store all sensor data",
      "Store all sensor data",
      "Store all sensor data",
    ];

    List<List<NavigationButton>> buttons = [
      [NavigationButton("Button", "icons/about.png", Colors.green, "/about", false),
        NavigationButton("Button", "icons/about.png", Colors.blue, "/about", false)],
      [NavigationButton("Button", "icons/about.png", Colors.green, "http://flutter.dev", true)],
      [NavigationButton("Button", "icons/about.png", Colors.green, "http://flutter.dev", true)]
    ];

    return Scaffold(
        body: Container(
          child: Row(
            children: [
              Expanded(
                child: Column(children: [
                  Text("Creative Motion apps"),
                  Text("Smarter companion with you")
                ]), flex: 3,
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return PhoneAppShow(paths[index], titles[index], comments[index], c[index], "fda", buttons[index], false);
                      }
                  ), flex: 7,
              ),

            ],
          ),
        ),
    );
  }

  Widget getPhoneVersion() {
    List<MaterialColor> c = [Colors.red, Colors.green, Colors.blue];
    List<String> paths = [
      "assets/images/SensorBox.png",
      "assets/images/SensorBox.png",
      "assets/images/SensorBox.png",
    ];
    List<String> titles = [
      "SensorBox",
      "SensorBox",
      "SensorBox",
    ];
    List<String> comments = [
      "Store all sensor data",
      "Store all sensor data",
      "Store all sensor data",
    ];

    List<List<NavigationButton>> buttons = [
      [NavigationIcon("Button", "icons/about.png", Colors.green, "/about", false),
        NavigationIcon("Button", "icons/about.png", Colors.blue, "/about", false),
        NavigationIcon("Button", "icons/about.png", Colors.blue, "/about", false)],
      [NavigationIcon("Button", "icons/about.png", Colors.green, "https://www.google.com/", true)],
      [NavigationIcon("Button", "icons/about.png", Colors.green, "https://www.google.com/", true)]
    ];

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
              Container(
                child: Column(children: [
                  Text("Creative Motion apps"),
                  Text("Smarter companion with you")
                ]),
              ),
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return PhoneAppShow(paths[index], titles[index], comments[index], c[index], "fda", buttons[index], false);
                  })
            ])
        )
    );
  }
}

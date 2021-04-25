import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';

/// header for the desktop, where the half occupies profile picture
/// and background other half is created by text and color
class PersonalHeaderDesktop extends StatelessWidget {
  /// default constructor
  const PersonalHeaderDesktop(
      {required this.title,
      String? subtitle,
      required this.pathImage,
      required this.pathBackground,
      required this.backgroundColor,
      required this.textColor,
      required this.buttons})
      : subtitle = subtitle ?? '';

  /// background image
  final String pathBackground;

  /// path to image as profile picture
  final String pathImage;

  /// title of the header
  final String title;

  /// subtitle of the header
  final String subtitle;

  /// buttons under the subtitle
  final List<Widget> buttons;

  /// background color
  final Color backgroundColor;

  /// text color
  final Color textColor;

  @override
  Widget build(BuildContext context) => Container(
      height: 350,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      textAlign: TextAlign.center,
                      size: 50,
                      text: title,
                      bold: true,
                      maxLines: 1,
                      color: textColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      textAlign: TextAlign.center,
                      size: 30,
                      text: subtitle,
                      bold: true,
                      maxLines: 2,
                      color: textColor,
                    ),
                  ),
                  Wrap(
                    children: buttons,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: PersonalHeaderPhone(
                buttons: buttons,
                pathImage: pathImage,
                pathBackground: pathBackground,
                notOnTop: true,
                backgroundColor: backgroundColor,
                textColor: textColor,
                title: '',
              ))
        ],
      ));
}

/// phone part creates profile picture and background part
/// suitable for phone dimensions, without text
class PersonalHeaderPhone extends PersonalHeaderDesktop {
  /// default constructor - similar to desktop version
  const PersonalHeaderPhone(
      {required String pathBackground,
      required String pathImage,
      required String title,
      required Color backgroundColor,
      required Color textColor,
      required List<Widget> buttons,
      required this.notOnTop})
      : super(
            title: title,
            pathImage: pathImage,
            pathBackground: pathBackground,
            backgroundColor: backgroundColor,
            textColor: textColor,
            buttons: buttons);

  /// changes of the padding if the header is on top
  final bool notOnTop;

  @override
  Widget build(BuildContext context) => Container(
        width: notOnTop ? null : MediaQuery.of(context).size.width,
        height: notOnTop ? null : 280,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(pathBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: notOnTop ? 125 : 70,
                  child: Image.asset(
                    pathImage,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontSize: 30),
                ),
              ),
              if (notOnTop)
                const SizedBox.shrink()
              else
                Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Wrap(children: buttons))
            ],
          ),
        ),
      );
}

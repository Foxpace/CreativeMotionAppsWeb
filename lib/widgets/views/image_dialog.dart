import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// shows fullscreen dialog with image and button to cancel
void showImageDialog(BuildContext context, String imagePath) {
  showGeneralDialog(
      context: context,
      barrierColor: Colors.black12.withOpacity(0.6),
      barrierDismissible: false,
      pageBuilder: (_, __, ___) => Stack(
            children: <Widget>[
              SizedBox.expand(child: Image.asset(imagePath)),
              Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    onPressed: () => Navigator.pop(context),
                    backgroundColor: Colors.transparent,
                    child: const Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                  ))
            ],
          ));
}

/// [getClickAbleImage] creates widget with Image, which can be shown in
/// full screen dialog with implementation above
Widget getClickableImage(BuildContext buildContext, String path, double? height,
        Color? background) =>
    ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) =>
            GestureDetector(
                onTap: () => showImageDialog(buildContext, path),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Container(
                      color: background,
                      child: Image.asset(
                        path,
                        fit: BoxFit.contain,
                        height: height,
                      )),
                )));

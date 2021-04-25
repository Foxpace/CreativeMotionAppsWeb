import 'package:creative_motion_app/libs/libs_content.dart';
import 'package:creative_motion_app/libs/libs_widget.dart';
import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [LibsPage] main library page
class LibsPage extends StatelessWidget {
  /// default constructor with navigation callback to change sites
  const LibsPage(this.navigationCallBack);

  /// callback to change sites
  final void Function(BuildContext buildContext, String page)
      navigationCallBack;

  /// column with the scrollable column and widgets of the created libraries
  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => navigationCallBack(
                context,
                R.paths_root,
              ),
              backgroundColor: Colors.white,
              child: const Icon(Icons.home, color: Colors.black),
            ),
            body: Center(
              child: Container(
                height: MediaQuery.of(context).copyWith().size.height,
                color: CustomColors.black,
                child: RawScrollbar(
                  thumbColor: Colors.white70,
                  isAlwaysShown: true,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          const TextWidget(
                              text: Strings.main_libraries,
                              size: 50,
                              color: CustomColors.white,
                              textAlign: TextAlign.center,
                              bold: true,
                              maxLines: 1),
                          ...LibsContent.libs
                              .map((LibsContent lib) => LibsWidget(lib))
                              .toList()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ));
}

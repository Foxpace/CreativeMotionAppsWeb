import 'package:creative_motion_app/widgets/page_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// basic class to inherit to create page
/// default is WEB_SCROLLER with white background
class PageContent {
  /// default constructor
  const PageContent(this.navigation);

  /// page view scroller
  static const int pageView = 0;

  /// web scroller
  static const int webScroller = 1;

  /// nested scroller
  static const int nestedScroller = 2;

  /// callback to launch other parts of the site
  final Function(BuildContext context, String url) navigation;

  /// color background
  final Color colorBackground = Colors.white;

  /// default type
  final int type = webScroller;

  /// place to add widgets with dimensions for the desktop
  List<Widget> getPagesDesktop(
          BuildContext buildContext, SizingInformation sizingInformation) =>
      <Widget>[];

  /// place to add widgets with dimensions for the phone
  List<Widget> getPagesPhone(
          BuildContext buildContext, SizingInformation sizingInformation) =>
      <Widget>[];

}

///
class BioPageContent extends PageContent {
  /// default constructor
  BioPageContent(Function(BuildContext context, String url) navigation)
      : super(navigation);

  @override
  final int type = PageContent.nestedScroller;

  /// header to add tabbar / profile picture with motto
  late final Widget header;

  /// other content
  late final List<Widget> content;

  /// for compatibility with NESTED_SCROLLER
  late final List<Tab> tabs;

  /// selected widget color
  final Color selectedWidget = Colors.white;

  /// unselected widget color
  final Color unselectedWidget = Colors.black26;
}

/// [PageScaffold] is parent widget for all pages and decides,
/// which type to build
/// based on dimensions of the screen
class PageScaffold extends StatelessWidget {
  /// default constructor
  const PageScaffold({required this.pageContent});

  /// content to show
  final PageContent pageContent;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
          builder: (BuildContext context, SizingInformation sizingInformation) {
        switch (pageContent.type) {
          case PageContent.pageView:
            return PageWebScroller(
              pages: sizingInformation.isDesktop
                  ? pageContent.getPagesDesktop(context, sizingInformation)
                  : pageContent.getPagesPhone(context, sizingInformation),
            );
          case PageContent.webScroller:
            return WebScroller(
              navigation: pageContent.navigation,
              backgroundColor: pageContent.colorBackground,
              pages: sizingInformation.isDesktop
                  ? pageContent.getPagesDesktop(context, sizingInformation)
                  : pageContent.getPagesPhone(context, sizingInformation),
            );
          case PageContent.nestedScroller:
            return sizingInformation.isDesktop || sizingInformation.isTablet
                ? WebScroller(
                    navigation: pageContent.navigation,
                    backgroundColor: pageContent.colorBackground,
                    pages:
                        pageContent.getPagesDesktop(context, sizingInformation))
                : NestedScroller(bioPageContent: pageContent as BioPageContent);
        }
        return WebScroller(
          navigation: pageContent.navigation,
          backgroundColor: pageContent.colorBackground,
          pages: sizingInformation.isDesktop
              ? pageContent.getPagesDesktop(context, sizingInformation)
              : pageContent.getPagesPhone(context, sizingInformation),
        );
      });
}

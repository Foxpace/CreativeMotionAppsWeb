import 'package:creative_motion_app/apps/besafebox/besafebox_app_content.dart';
import 'package:creative_motion_app/apps/besafebox/besafebox_science_content.dart';
import 'package:creative_motion_app/apps/ecgid/ecgid_page.dart';
import 'package:creative_motion_app/apps/sensorbox/sensorbox_content.dart';
import 'package:creative_motion_app/bio/bio_page.dart';
import 'package:creative_motion_app/blog/blog_page.dart';
import 'package:creative_motion_app/home/home_page.dart';
import 'package:creative_motion_app/libs/libs_page.dart';
import 'package:creative_motion_app/navigation/page_not_found.dart';
import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/widgets/page_init.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// url holder
class WebPath {
  /// show page
  WebPath.page(this.path) : isUnknown = false;

  /// show home
  WebPath.home()
      : path = R.paths_root,
        isUnknown = false;

  /// show unknown
  WebPath.unknown()
      : path = '/404',
        isUnknown = true;

  /// unknown url flag
  final bool isUnknown;

  /// actual url
  final String path;

  /// checker for the existence of the page
  bool get isInPaths => R.pathsList.contains(path);
}

/// [WebUrlParser] uses written string in browser window to decide,
/// which page to show
class WebUrlParser extends RouteInformationParser<WebPath> {
  @override
  Future<WebPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location == null) return WebPath.unknown();

    final Uri uri = Uri.parse(routeInformation.location!); // getting path

    if (uri.pathSegments.isEmpty) return WebPath.home(); // root

    if (uri.pathSegments.length == 1) {
      // getting page
      final String path = '/${uri.pathSegments.elementAt(0)}';
      return WebPath.page(path);
    }

    return WebPath.unknown();
  }

  /// modifies history of the browser
  @override
  RouteInformation? restoreRouteInformation(WebPath path) {
    if (path.isUnknown) return const RouteInformation(location: '/404');
    return RouteInformation(location: path.path);
  }
}

/// main navigator
class WebUrlDelegate extends RouterDelegate<WebPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<WebPath> {
  String _selectedPage = R.paths_root;

  /// flag to show 404
  bool show404 = false;

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  /// getter for the actial page
  @override
  WebPath? get currentConfiguration {
    if (show404) return WebPath.unknown();
    if (_selectedPage == R.paths_root) return WebPath.home();
    return WebPath.page(_selectedPage);
  }

  /// changes site
  void navigationCallBack(BuildContext buildContext, String page) {
    _selectedPage = page;
    show404 = false;
    notifyListeners();
  }

  /// page builder
  @override
  Widget build(BuildContext context) {
    return Navigator(
      // ignore: always_specify_types
      onPopPage: (Route route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _selectedPage = R.paths_root;
        show404 = false;
        notifyListeners();
        return true;
      },
      key: navigatorKey,
      pages: <MaterialPage<Widget>>[
        if (show404)
          MaterialPage<Widget>(
              key: const ValueKey<String>(R.paths_error), child: UnknownPage())
        else
          _getPage(context, _selectedPage)
      ],
    );
  }

  /// based on the path -> page creation - most of the pages use PageScaffold
  /// because of their modularity
  MaterialPage<Widget> _getPage(BuildContext context, String route) {
    switch (route) {
      case R.paths_root:
        return MaterialPage<Widget>(
            key: const ValueKey<String>(R.paths_root),
            child: Home(navigationCallBack));
      case R.paths_libs:
        return MaterialPage<Widget>(
            key: const ValueKey<String>(R.paths_libs),
            child: LibsPage(navigationCallBack));
      case R.paths_blog:
        return MaterialPage<Widget>(
            key: const ValueKey<String>(R.paths_blog), child: BlogPage());
      case R.paths_sensorbox:
        return MaterialPage<Widget>(
            key: const ValueKey<String>(R.paths_sensorbox),
            child: PageScaffold(
                pageContent: SensorBoxContent(navigationCallBack)));
      case R.paths_besafebox_app:
        return MaterialPage<Widget>(
            key: const ValueKey<String>(R.paths_besafebox_app),
            child: PageScaffold(
                pageContent: BeSafeBoxAppContent(navigationCallBack)));
      case R.paths_besafebox_science:
        return MaterialPage<Widget>(
            key: const ValueKey<String>(R.paths_besafebox_science),
            child: PageScaffold(
                pageContent: BeSafeBoxScienceContent(navigationCallBack)));
      case R.paths_ecg_biometrics_science:
        return MaterialPage<Widget>(
            key: const ValueKey<String>(R.paths_ecg_biometrics_science),
            child: PageScaffold(
              pageContent: EcgBiometry(navigationCallBack),
            ));
      case R.paths_bio:
        return MaterialPage<Widget>(
            key: const ValueKey<String>(R.paths_ecg_biometrics_science),
            child: PageScaffold(pageContent: BioPage(navigationCallBack)));
    }

    return MaterialPage<Widget>(
        key: const ValueKey<String>(R.paths_root),
        child: Home(navigationCallBack));
  }

  @override
  Future<void> setNewRoutePath(WebPath path) async {
    if (path.isUnknown || !path.isInPaths) {
      _selectedPage = '';
      show404 = true;
      return;
    }

    if (path.isInPaths) {
      _selectedPage = path.path;
      show404 = false;
      return;
    }

    _selectedPage = R.paths_root;
    show404 = false;
  }

  /// [launchURL] uses [url] string to start external URL
  static Future<void> launchURL(String url) async {
    if (url == '') {
      return;
    }
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}

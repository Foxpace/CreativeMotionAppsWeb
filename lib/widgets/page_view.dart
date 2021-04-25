import 'package:creative_motion_app/resources/R.dart';
import 'package:creative_motion_app/widgets/page_init.dart';
import 'package:creative_motion_app/widgets/views/custom_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// [PageWebScroller] - every view is size of the screen, which still
/// can be scrolled smoothly
class PageWebScroller extends StatelessWidget {
  /// [pages] are widgets to show - size of the screen on height and width
  const PageWebScroller({required this.pages});

  /// pages to show - eer as whole screen
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Stack(
      children: <Widget>[
        // pageView
        Scaffold(
          body: PageView(
              controller: controller,
              scrollDirection: Axis.vertical,
              pageSnapping: false,
              children: pages),
        ),
        // page indicator on right center
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Container(
              height: MediaQuery.of(context).copyWith().size.height,
              width: 20,
              color: Colors.transparent,
              child: Center(
                child: SmoothPageIndicator(
                    axisDirection: Axis.vertical,
                    controller: controller,
                    // PageController
                    count: pages.length,
                    effect: const WormEffect(activeDotColor: Colors.white),
                    // your preferred effect
                    onDotClicked: (int index) {
                      controller.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// [WebScroller] basic scroller, where widgets can have different heights
/// used everywhere
class WebScroller extends StatelessWidget {
  /// constructor [pages] widgets of different height, [navigation]
  /// callback for home button
  const WebScroller(
      {required this.pages,
      required this.backgroundColor,
      required this.navigation});

  /// pages to scroll
  final List<Widget> pages;

  /// background color
  final Color backgroundColor;

  /// navigation callback
  final Function(BuildContext context, String url) navigation;


  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor,
        // floating button for home direction
        floatingActionButton: FloatingActionButton(
          onPressed: () => navigation(
            context,
            R.paths_root,
          ),
          backgroundColor: Colors.white,
          child: const Icon(Icons.home, color: Colors.black),
        ),
        body: Center(
          child: RawScrollbar(
            thumbColor: Colors.white70,
            isAlwaysShown: true,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pages,
                ),
              ),
            ),
          ),
        ),
      );
}

/// page, where the header is the same for multiple pages placed beside
/// each other like in TabBarView. Pages are switched through the header
/// and is in sliver form so it disappears, when it is scrolled up.
class NestedScroller extends StatefulWidget {
  /// default constructor
  const NestedScroller({required this.bioPageContent});

  /// custom object - not finished implementation
  final BioPageContent bioPageContent;

  @override
  State<StatefulWidget> createState() => NestedScrollerState(bioPageContent);
}

/// stateful part
class NestedScrollerState extends State<NestedScroller>
    with SingleTickerProviderStateMixin {
  /// custom controllers for the widget scrolling and switching
  NestedScrollerState(this.bioPageContent) {
    _scrollController = ScrollController();
    _tabController = TabController(
        length: bioPageContent.tabs.length, vsync: this, initialIndex: 1);
  }

  late final TabController _tabController;
  late final ScrollController _scrollController;

  /// content to use
  final BioPageContent bioPageContent;

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool value) => <Widget>[
            SliverToBoxAdapter(child: bioPageContent.header),
            SliverToBoxAdapter(
                child: ColoredTabBar(
              bioPageContent.colorBackground,
              TabBar(
                controller: _tabController,
                labelColor: bioPageContent.selectedWidget,
                indicatorColor: bioPageContent.selectedWidget,
                unselectedLabelColor: bioPageContent.unselectedWidget,
                tabs: bioPageContent.tabs,
              ),
            ))
          ],
          body: SizedBox(
            child: TabBarView(
              controller: _tabController,
              children: bioPageContent.content,
            ),
          ),
        ),
      );
}

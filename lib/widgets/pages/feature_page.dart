import 'package:creative_motion_app/resources/colours.dart';
import 'package:creative_motion_app/resources/strings.dart';
import 'package:creative_motion_app/widgets/cards/card_carrier.dart';
import 'package:creative_motion_app/widgets/cards/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// feature page shows required number of cards with icons, titles and texts to
/// show as many features as needed
///
class FeaturePage extends StatelessWidget {
  /// [CardCarrier] is needed to be created, which will
  /// format the cards in right manner as user requires
  /// [ratios] [desktop, tablet, phone] are used
  /// to create right grid for different dimensions
  /// [tightLayout]
  FeaturePage(
      {required this.cardCarrier,
      Color? colorBackground,
      String? title,
      Color? colorTitle,
      List<int>? ratios,
      double? siteSize})
      : colorBackground = colorBackground ?? CustomColors.blue,
        title = title ?? Strings.features,
        colorTitle = colorTitle ?? Colors.white,
        ratios = ratios ?? <int>[8, 4, 4],
        siteSize = siteSize ?? 850;

  /// color of the background
  final Color colorBackground;

  /// color of the title
  final Color colorTitle;

  /// text of the title
  final String title;

  /// creator of the cards
  final CardCarrier cardCarrier;

  /// ratios to split
  final List<int> ratios;

  /// site size
  final double siteSize;

  /// returns features based on the dimensions
  List<Widget> getFeatures(
      BuildContext context, SizingInformation sizingInformation) {
    switch (sizingInformation.deviceScreenType) {
      case DeviceScreenType.desktop:
        return _getFeaturesWidgets(context, ratios[0], sizingInformation);
      case DeviceScreenType.tablet:
        return _getFeaturesWidgets(context, ratios[1], sizingInformation);
      default:
        return _getFeaturesWidgets(context, ratios[2], sizingInformation);
    }
  }

  /// 1. cards are generated
  /// 2. number of pages is inferred
  /// 3. cards are split by the required number of pages and ratios
  /// into rows and column
  List<Widget> _getFeaturesWidgets(BuildContext buildContext, int splitRatio,
      SizingInformation sizingInformation) {
    // 1.
    final List<Widget> cards = cardCarrier
        .getCards(buildContext, sizingInformation)
        .map((Widget card) => Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
              child: card,
            )))
        .toList();
    final int len = cards.length;

    // 2.
    int numPages;
    int updatedSplitRatio;
    if (1 > len / splitRatio) {
      numPages = 1;
      updatedSplitRatio = len;
    } else {
      numPages = len / splitRatio as int;
      numPages = numPages + ((len % splitRatio) > 0 ? 1 : 0);
      updatedSplitRatio = splitRatio;
    }

    final List<Widget> pages = <Widget>[];

    // 3.
    for (int i = 0; i < numPages; i++) {
      final List<Widget> partCards =
          cards.sublist(i * updatedSplitRatio, (i + 1) * updatedSplitRatio);

      switch (sizingInformation.deviceScreenType) {
        case DeviceScreenType.desktop:
          pages.add(
            Container(
                height: numPages == 1 && cards.length <= ratios[0] / 2
                    ? siteSize * 0.7
                    : siteSize,
                color: colorBackground,
                child: _getDesktopFeaturePage(buildContext, sizingInformation,
                    partCards, i == 0, ratios[0])),
          );
          break;
        case DeviceScreenType.tablet:
          pages.add(Container(
              height: siteSize * 1.25, // original was 1 before tightlayout
              color: colorBackground,
              child: _getDesktopFeaturePage(buildContext, sizingInformation,
                  partCards, i == 0, ratios[1])));
          break;
        default:
          pages.add(Container(
              height: siteSize * 1.5,
              color: colorBackground,
              child: _getPhoneFeaturePage(
                  buildContext, sizingInformation, partCards, i == 0)));
          break;
      }
    }

    return pages;
  }

  /// desktop version has multiple lines
  Widget _getDesktopFeaturePage(
      BuildContext context,
      SizingInformation sizingInformation,
      List<Widget> cards,
      bool first,
      int ratios) {
    List<Widget> partCards1;
    List<Widget> partCards2;

    // line can be omitted, if there is not enough cards
    if (cards.length > ratios / 2) {
      partCards1 = cards.sublist(0, cards.length / 2 as int);
      partCards2 = cards.sublist(cards.length / 2 as int, cards.length);
    } else {
      partCards1 = cards;
      partCards2 = <Widget>[];
    }

    final List<Widget> content = <Widget>[
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: partCards1),
        ),
      ),
    ];

    if (partCards2.isNotEmpty) {
      content.add(Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: partCards2),
        ),
      ));
    }

    if (first) {
      content.insert(0, HelperUI.getTitle(title, 60, colorTitle));
    } else {
      // adding empty titles for correct padding of the cards
      content.insert(0, HelperUI.getTitle('', 30, colorTitle));
      content.add(HelperUI.getTitle('', 30, colorTitle));
    }

    return Center(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: content,
        ),
      ),
    );
  }

  /// phone version has all the features in one column
  Widget _getPhoneFeaturePage(BuildContext context,
      SizingInformation sizingInformation, List<Widget> cards, bool first) {
    List<Widget> content = <Widget>[];
    if (first) {
      content = <Widget>[HelperUI.getTitle(title, 40, colorTitle), ...cards];
    } else {
      content = <Widget>[
        HelperUI.getTitle('', 20, colorTitle),
        ...cards,
        HelperUI.getTitle('', 20, colorTitle)
      ];
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: content,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) =>
          Column(
            children: getFeatures(context, sizingInformation),
          ));
}

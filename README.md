# Creative Motion Apps - Website
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

**This repository has all the code of the site, which can be found here: [creativemotion.app](https://creativemotion.app/#/)**. For more information about my projects and myself, visit the site !

The website is created with Flutter SDK and Dart programming language. 

## Building blocks

The site uses custom scrollers, which can contain multiple web blocks. Cards are used to represent great variety of content in a comprehensible manner. All the parts with a slight modification sometimes can work independently.  All the widgets are adjusted to be used with all screen sizes. **All the blocks can be find under Lib -> widgets or Lib -> widgets -> pages / cards**. To see it in action, visit my site **[creativemotion.app](https://creativemotion.app/#/)**.

### Web scrollers 

Takes as input all the web blocks and manages their scrolling and order. The site uses only WebScroller. 

- **PageWebScroller** - treats pages as blocks, which fill whole height of the screen - can create "slide show"
- **WebScroller** - default scroller, which can take blocks of different sizes - works as a traditional scrolling site
- **NestedScroller** - behaves like a TabBarView with one header for all the tabs

### Web blocks

- **CarouselCardPage** - creates the carousel, which takes the generator of the cards
- **DoubleWidgetPage** - takes any two widgets and places them into a page
- **FeaturePage** - takes generator of the cards and places them in a grid 2x8, 4x4 or in a column in accordance to the screen size and orientation
- **IntroductionPage** - shows a large title with a description of the left supported with the carousel on the right to showcase a product
- **PersonalHeader** -  can be used as holder for a profile picture with a welcoming text and a custom background picture
- **StepByStepPage** - the column of indexed cards, which can be used to explain a procedure
- **TabFiller** - should be used with the NestedScroller combination to add all the content
- **TimeLinePage** - creates a dotted line, which are adjacent to custom cards
- **WrapperPage** - can contain multiple widgets. The behavior is similar to Flutter Wrap

### Web cards

- **CardText** -  basic card, which holds a title and a text
- **CardTextIcon** - an additional icon is placed on top or besides the text
- **CardButtonUrl** - similar to the CardText, but on the bottom is placed a button, which can open a new page
- **CardImage** - takes a image with a subtitle
- **CardHoverUrl** - similar to the CardImage. On hover with the mouse, the background can change color and on click open a new page.
- **CardStep** - replaces the image with a number of current index

## Thanks goes to:

[Responsive builder](https://pub.dev/packages/responsive_builder) - contains widgets that allows you to create a readable responsive UI [![License: MIT](https://camo.githubusercontent.com/78f47a09877ba9d28da1887a93e5c3bc2efb309c1e910eb21135becd2998238a/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c6963656e73652d4d49542d79656c6c6f772e737667)](https://opensource.org/licenses/MIT) 

[URL launcher](https://pub.dev/packages/url_launcher) - A Flutter plugin for launching a URL. [![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause) 

[AutoSizeText](https://pub.dev/packages/auto_size_text) - Flutter widget that automatically resizes text to fit perfectly within its bounds [![License: MIT](https://camo.githubusercontent.com/78f47a09877ba9d28da1887a93e5c3bc2efb309c1e910eb21135becd2998238a/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c6963656e73652d4d49542d79656c6c6f772e737667)](https://opensource.org/licenses/MIT) 

[Smooth page indicator](https://pub.dev/packages/smooth_page_indicator) - Customizable animated page indicator with a set of built-in effects [![License: MIT](https://camo.githubusercontent.com/78f47a09877ba9d28da1887a93e5c3bc2efb309c1e910eb21135becd2998238a/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c6963656e73652d4d49542d79656c6c6f772e737667)](https://opensource.org/licenses/MIT) 

[Carousel slider](https://pub.dev/packages/carousel_slider) - A carousel slider widget, support infinite scroll and custom child widget ![License: MIT](https://camo.githubusercontent.com/78f47a09877ba9d28da1887a93e5c3bc2efb309c1e910eb21135becd2998238a/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c6963656e73652d4d49542d79656c6c6f772e737667)

[TimelineTile](https://pub.dev/packages/timeline_tile) - A package to help you build highly customizable timelines with Flutter ![License: MIT](https://camo.githubusercontent.com/78f47a09877ba9d28da1887a93e5c3bc2efb309c1e910eb21135becd2998238a/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c6963656e73652d4d49542d79656c6c6f772e737667)

[Lint](https://pub.dev/packages/lint) - An opiniated, community-driven set of lint rules for Dart and Flutter projects. Like pedantic but stricter (no changes) [![License](https://camo.githubusercontent.com/2a2157c971b7ae1deb8eb095799440551c33dcf61ea3d965d86b496a5a65df55/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c6963656e73652d417061636865253230322e302d626c75652e737667)](https://opensource.org/licenses/Apache-2.0) 

## Used media from/by: 

Sitting icon from: https://www.freepik.com

Lazy icon from: https://icons8.com/

SVM icon by sachin modgekar from the [Noun Project](https://thenounproject.com/)

Random Forest icon by Knut M. Synstad from the [Noun Project](https://thenounproject.com/)

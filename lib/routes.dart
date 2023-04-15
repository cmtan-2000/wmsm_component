import 'package:flutter/cupertino.dart';
import 'package:wmsm_component/view/intro/introduction.dart';
import 'package:wmsm_component/view/scenario_1/page_1.dart';
import 'package:wmsm_component/view/widgetPage.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const Intro(),
  // '/profile': (context) => ProfileScreen(),
  'scenario_1/page_1': (context) => const page_1(),
  '/w': (context) => WidgetPage()
};

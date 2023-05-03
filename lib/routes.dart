import 'package:flutter/cupertino.dart';
import 'package:wmsm_component/intro/introduction.dart';
import 'package:wmsm_component/dashboard/view/page_1.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const Intro(),
  '/dashboard': (context) => const Dashboard(),
};

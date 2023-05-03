import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wmsm_component/custom/themes/custom_theme.dart';
import 'package:wmsm_component/dashboard/model/sleep.dart';
import 'package:wmsm_component/dashboard/model/step.dart';
import 'package:wmsm_component/routes.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  Hive
    ..initFlutter()
    ..registerAdapter(SleepAdapter())
    ..registerAdapter(StepAdapter());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wellness',
      theme: customTheme,
      initialRoute: '/',
      routes: routes,
    );
  }
}

// ignore_for_file: non_constant_identifier_names, camel_case_types, avoid_print, prefer_const_constructors, unnecessary_null_comparison

/* 
consist of:
  sign-in.dart
  sign-up.dart
  forget-password.dart.
*/

import 'package:flutter/material.dart';

import '../custom/widgets/custom_outlinedbutton.dart';
import 'signin_form.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Theme.of(context).primaryColor,
              ],
              stops: const [
                0.2,
                1.0,
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: FractionallySizedBox(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      // padding: const EdgeInsets.symmetric(
                      //     vertical: 55, horizontal: 30),
                      padding: EdgeInsets.fromLTRB(30, 55, 30, 0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: const content(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class content extends StatelessWidget {
  const content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          WidgetSignIn(),
          WidgetBottom(),
        ]);
  }
}

class WidgetBottom extends StatelessWidget {
  const WidgetBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomOutlinedButton(
                onPressed: () => print('Outline_1'),
                iconData: null,
                text: 'Outline_1',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomOutlinedButton(
                onPressed: () => print('Outline_2'),
                iconData: Icons.time_to_leave,
                text: 'Outline_2',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text('Version 5.3.7 +766')
      ],
    );
  }
}

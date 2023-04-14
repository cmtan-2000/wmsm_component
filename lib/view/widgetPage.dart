// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:wmsm_component/view/custom/widgets/custom_card.dart';
import 'package:wmsm_component/view/shared/card_percent_indicator.dart';

import 'custom/widgets/custom_button.dart';
import 'custom/widgets/custom_textformfield.dart';

class WidgetPage extends StatelessWidget {
  WidgetPage({super.key});

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Page')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomTextButton(
            onPressed: () => print('test'),
            context: context,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextButton(
            onPressed: () => print('test'),
            text: "test",
            context: context,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            controller: _passwordController,
            hintText: 'Test',
            isNumberOnly: true,
            context: context,
          ),
          Row(
            children: const <Widget>[
              CardPercentIndicator(
                title: '10%',
                percent: 0.1,
                body: 'Steps Remaining',
                remain: 31360,
                target: 313600,
                fontsize: 20,
              ),
              CardPercentIndicator(
                title: '30%',
                percent: 0.3,
                body: 'Sleep Remaining',
                remain: 132,
                target: 442,
                fontsize: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}

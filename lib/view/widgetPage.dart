// ignore_for_file: file_names

import 'package:flutter/material.dart';

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
          )
        ],
      ),
    );
  }
}

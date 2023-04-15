// ignore_for_file: file_names, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wmsm_component/view/custom/widgets/custom_card.dart';
import 'package:wmsm_component/view/custom/widgets/custom_elevatedbutton.dart';
import 'package:wmsm_component/view/shared/card_percent_indicator.dart';

import 'custom/widgets/custom_alertdialog.dart';
import 'custom/widgets/custom_button.dart';
import 'custom/widgets/custom_textformfield.dart';

class WidgetPage extends StatelessWidget {
  WidgetPage({super.key});

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Page'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomTextButton(
            onPressed: () => print('test'),
            child: Text('button_1'),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextButton(
            onPressed: () => print('test'),
            child: Text('button_2'),
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
          Text(
            'Card Percent Indicator',
            style: Theme.of(context).textTheme.headlineSmall,
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
          ),
          Text(
            'Custome Alert Dialog Box',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          CustomElevatedButton(
            context: context,
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => CustomAlertDialog(
                context: context,
                maxWidthDialog: 0.9,
                icon: Icon(
                  Icons.abc_outlined,
                  size: 90,
                ),
                title: Text('Unable to sync data'),
                contentBody: Text(
                  'There seems to be not data on your health app. Please update the data on your health app, Etiqa+ will auto sync your health app data.',
                ),
                onCancel: () {
                  Navigator.of(context).pop();
                },
                onConfirm: () {
                  print('test');
                },
                toColumn: true,
                toExpanded: true,
              ),
            ),
            child: const Text('Click_alertDialog_box'),
          ),
        ],
      ),
    );
  }
}

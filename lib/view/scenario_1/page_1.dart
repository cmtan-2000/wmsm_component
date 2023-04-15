import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wmsm_component/view/shared/card_percent_indicator.dart';
import 'package:wmsm_component/view/shared/header_widget.dart';
import 'package:wmsm_component/view/shared/sleep_box.dart';
import 'package:wmsm_component/view/shared/steps_box.dart';

class page_1 extends StatelessWidget {
  const page_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.lightBlue[100],
        elevation: 0,
        title: const Text("Wellness"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(physics: const ClampingScrollPhysics(), children: [
        <Widget>[
          header_widget(),
          Divider(
            color: Colors.grey[300],
            thickness: 10,
          ).paddingDirectional(vertical: 20),
          Container(

          )
        ].toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        ),
      ]),
    );
  }
}


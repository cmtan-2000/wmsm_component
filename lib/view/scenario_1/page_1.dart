import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wmsm_component/view/shared/sleep_box.dart';
import 'package:wmsm_component/view/shared/steps_box.dart';

class page_1 extends StatelessWidget {
  const page_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
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
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        <Widget>[
          Stack(children: [
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              child: <Widget>[
                <Widget>[
                  const Text(
                    "Quarter 1 Challenge",
                    style: TextStyle(color: Colors.black),
                  ).fontSize(20).fontWeight(FontWeight.bold),
                ]
                    .toRow(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    )
                    .padding(bottom: 10),
                <Widget>[
                  const Text(
                    "Complete to get one day unrecorded leave",
                    style: TextStyle(color: Colors.grey),
                  ).fontSize(12),
                  const Text("35 days left")
                      .fontSize(13)
                      .fontWeight(FontWeight.bold),
                ]
                    .toRow(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    )
                    .padding(bottom: 40),
                <Widget>[
                  const Text(
                    "Data last sync at (13/4/2023, 1.45pm)",
                    style: TextStyle(color: Colors.black),
                  ).fontSize(12),
                  const Icon(
                    Icons.refresh,
                    color: Colors.grey,
                  ).padding(bottom: 10),
                ].toRow(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ]
                  .toColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                  )
                  .padding(horizontal: 20),
            ),
            Positioned(
              child: <Widget>[
                Flexible(
                    child: steps_box()),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: sleep_box()),
              ]
                  .toRow(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  )
                  .padding(horizontal: 20),
            ),
          ]),
          const Placeholder(),
        ].toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ]),
    );
  }
}

// SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: <Widget>[
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.35,
//                 child: page_header(),
//               ).padding(bottom: 20),
//               const Placeholder(),
//             ].toColumn(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//             ),
//           ),

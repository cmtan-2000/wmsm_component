import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wmsm_component/view/shared/card_percent_indicator.dart';

class header_widget extends StatelessWidget {
  const header_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
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
            const Text("35 days left").fontSize(13).fontWeight(FontWeight.bold),
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
        top: MediaQuery.of(context).size.height * 0.15,
        child: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: const CardPercentIndicator(
              title: '10%',
              percent: 0.1,
              body: 'Steps Remaining',
              remain: 31360,
              target: 313600,
              fontsize: 15,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: const CardPercentIndicator(
              title: '30%',
              percent: 0.3,
              body: 'Sleep Remaining',
              remain: 132,
              target: 442,
              fontsize: 15,
            ),
          ),
        ]
            .toRow(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            )
            .paddingDirectional(horizontal: 20),
      ),
    ]);
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:wmsm_component/custom/widgets/custom_card.dart';

class CardPercentIndicator extends StatelessWidget {
  const CardPercentIndicator({
    super.key,
    required this.title,
    required this.percent,
    required this.fontsize,
    required this.body,
    required this.remain,
    required this.target,
    this.widthCard,
  });

  final String? title, body;
  final double percent, fontsize;
  final double? widthCard;
  final int remain, target;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: widthCard ?? 300),
      child: CustomCard(
        customTitle: title ?? '{title}%',
        content: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[300],
            ),
            width: double.infinity,
            child: LinearPercentIndicator(
              padding: EdgeInsets.zero,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2000,
              percent: percent,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.yellow,
              backgroundColor: Colors.grey[200],
            ),
          ),
          Text(
            body!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontsize),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Text(remain.toString(),
                  style: TextStyle(fontSize: fontsize * (5 / 6))),
              const Text(' / '),
              Text(target.toString(),
                  style: TextStyle(fontSize: fontsize * (5 / 6))),
            ],
          )
        ],
      ),
    );
  }
}

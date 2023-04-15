import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wmsm_component/view/shared/card_percent_indicator.dart';

class sleep_box extends StatelessWidget {
  const sleep_box({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardPercentIndicator(
      title: '30%',
      percent: 0.3,
      body: 'Sleep Remaining',
      remain: 132,
      target: 442,
      fontsize: 15,
    );
  }
}

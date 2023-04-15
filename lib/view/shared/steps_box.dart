import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wmsm_component/view/shared/card_percent_indicator.dart';

class steps_box extends StatelessWidget {
  const steps_box({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardPercentIndicator(
      title: '10%',
      percent: 0.1,
      body: 'Steps Remaining',
      remain: 31360,
      target: 313600,
      fontsize: 15,
    );
  }
}

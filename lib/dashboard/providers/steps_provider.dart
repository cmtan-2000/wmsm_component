import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:wmsm_component/dashboard/model/step.dart';

class StepProvider extends StateNotifier<Step> {
  StepProvider() : super(Step(date: DateTime.now().toUtc(), stepCount: 0));

  Future<void> updateStepCount(DateTime date,int newStepCount) async {
    final box = await Hive.openBox('steps');
    final steps = box.get(date.toString())??<Step>[];
    final step = Step(date: state.date, stepCount: newStepCount);
    steps.add(step);
    await box.put(date.toString(), steps);
  }
}

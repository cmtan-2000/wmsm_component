import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:wmsm_component/dashboard/model/sleep.dart';

class SleepProvider extends StateNotifier<Sleep> {
  SleepProvider() : super(Sleep(date: DateTime.now(), sleepDuration: 0));

  Future<void> updateSleepDuration(double newSleepDuration) async {
    final updatedSleep =
        Sleep(date: state.date, sleepDuration: newSleepDuration);
    //<--This section should run once only to save final sleep duration to Hive
    final box = await Hive.openBox('sleep');
    await box.add(updatedSleep);
    //-->
    state = updatedSleep;
  }
}

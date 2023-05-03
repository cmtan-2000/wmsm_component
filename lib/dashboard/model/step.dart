
import 'package:hive/hive.dart';
part 'step.g.dart';

@HiveType(typeId: 1)
class Step {
  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final int stepCount;

  Step({
    required this.date,
    required this.stepCount,
  });
}

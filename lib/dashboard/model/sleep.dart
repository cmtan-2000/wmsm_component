import 'package:hive/hive.dart';
part 'sleep.g.dart';

@HiveType(typeId: 2)
class Sleep {
  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final double sleepDuration;

  Sleep({
    required this.date,
    required this.sleepDuration,
  });
}

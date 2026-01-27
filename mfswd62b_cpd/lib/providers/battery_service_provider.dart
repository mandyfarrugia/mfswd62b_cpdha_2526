import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/battery_service.dart';

final batteryServiceProvider = Provider<BatteryService>((ref) {
  return BatteryService();
});
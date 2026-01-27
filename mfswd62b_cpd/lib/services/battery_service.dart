import 'package:battery_plus/battery_plus.dart';

class BatteryService {
  final Battery batteryInstance = Battery();

  Future<int> getBatteryLevel() async {
    return await this.batteryInstance.batteryLevel;
  }
}
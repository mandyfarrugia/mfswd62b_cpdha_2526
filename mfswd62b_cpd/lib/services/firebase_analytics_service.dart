import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  static Future<void> logAddAsset() async {
    await _analytics.logEvent(
      name: 'add_asset_pressed',
    );
  }

  static Future<void> logDeleteAsset() async {
    await _analytics.logEvent(
      name: 'delete_asset',
    );
  }

  static Future<void> logLowBatteryBlocked() async {
    await _analytics.logEvent(
      name: 'blocked_due_to_low_battery',
    );
  }
}

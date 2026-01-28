import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfswd62b_cpd/services/battery_service.dart';
import 'package:mfswd62b_cpd/services/notification_service.dart';
import '../services/delete_confirmation_service.dart';
import '../services/objectbox_store_service.dart';
import '../screens/asset_management_home_screen.dart';

late ObjectBoxStoreService objectBoxStoreService;
late BatteryService batteryService;
late DeleteConfirmationService deleteConfirmationService;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  await NotificationService.requestPermission();
  objectBoxStoreService = await ObjectBoxStoreService.create();
  deleteConfirmationService = DeleteConfirmationService.create();
  
  runApp(
    const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AssetManagementHomeScreen()
      )
    )
  );
}
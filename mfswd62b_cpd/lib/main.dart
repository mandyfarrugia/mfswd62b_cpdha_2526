import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfswd62b_cpd/services/objectbox_store_service.dart';
import 'package:mfswd62b_cpd/screens/asset_management_home_screen.dart';

late ObjectBoxStoreService objectBoxStoreService;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBoxStoreService = await ObjectBoxStoreService.create();
  runApp(const ProviderScope(child: MaterialApp(debugShowCheckedModeBanner: false, home: AssetManagementHomeScreen())));
}

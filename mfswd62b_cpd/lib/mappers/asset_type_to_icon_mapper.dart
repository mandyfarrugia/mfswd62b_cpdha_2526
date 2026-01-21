import 'package:flutter/material.dart';
import 'package:mfswd62b_cpd/models/asset_type.dart';

class AssetTypeToIconMapper {
  static const Map<AssetType, IconData> assetTypeToIconMap = {
    AssetType.adapter: Icons.usb,
    AssetType.cable: Icons.cable,
    AssetType.gaming: Icons.gamepad,
    AssetType.desktop: Icons.desktop_windows_rounded,
    AssetType.television: Icons.screenshot_monitor,
    AssetType.laptop: Icons.laptop,
    AssetType.mobile: Icons.smartphone,
    AssetType.software: Icons.window_sharp,
    AssetType.tablet: Icons.tablet_mac_outlined,
    AssetType.other: Icons.question_mark_sharp
  };
}
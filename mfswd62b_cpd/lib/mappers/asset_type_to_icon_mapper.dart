import 'package:flutter/material.dart';
import 'package:mfswd62b_cpd/models/asset_type.dart';

class AssetTypeToIconMapper {
  static Map<AssetType, IconData> assetTypeToIconMap = {
    AssetType.adapter: Icons.usb,
    AssetType.cable: Icons.cable,
    AssetType.gaming: Icons.gamepad,
    AssetType.desktopPC: Icons.desktop_windows_rounded,
    AssetType.television: Icons.screenshot_monitor,
    AssetType.laptop: Icons.laptop,
    AssetType.mobilePhone: Icons.smartphone,
    AssetType.software: Icons.window_sharp,
    AssetType.tablet: Icons.tablet_mac_outlined
  };
}
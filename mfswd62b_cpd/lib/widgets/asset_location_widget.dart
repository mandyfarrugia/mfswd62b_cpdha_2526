import 'package:flutter/material.dart';
import 'package:mfswd62b_cpd/models/asset.dart';
import 'package:url_launcher/url_launcher.dart';

class AssetLocationWidget extends StatelessWidget {
  final Asset assetToDisplay;

  const AssetLocationWidget({required this.assetToDisplay, super.key});

  @override
  Widget build(BuildContext context) {
    final latitude = assetToDisplay.assetLocation.target?.latitude;
    final longitude = assetToDisplay.assetLocation.target?.longitude;
    final isLocationAvailable = assetToDisplay.assetLocation.hasValue;

    if (!isLocationAvailable || latitude == null || longitude == null) {
      return const Text(
        'No location data available',
        style: TextStyle(color: Colors.grey),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.location_on, color: Colors.redAccent),
            SizedBox(width: 6),
            Text(
              'Asset location',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          'Latitude: $latitude\nLongitude: $longitude',
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
          icon: const Icon(Icons.map),
          label: const Text('Open in map'),
          onPressed: () async {
            final uri = Uri.parse(
              'https://www.openstreetmap.org/?mlat=$latitude&mlon=$longitude#map=16/$latitude/$longitude',
            );

            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
        ),
      ],
    );
  }
}
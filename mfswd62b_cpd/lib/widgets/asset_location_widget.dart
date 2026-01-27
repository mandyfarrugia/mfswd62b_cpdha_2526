import 'package:flutter/material.dart';
import 'package:mfswd62b_cpd/models/asset.dart';
import 'package:mfswd62b_cpd/widgets/asset_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AssetLocationWidget extends StatelessWidget {
  final Asset assetToDisplay;

  const AssetLocationWidget({required this.assetToDisplay, super.key});

  Future<void> redirectToMap(BuildContext context, double latitude, double longitude) async {
    final uri = Uri.parse('https://www.openstreetmap.org/?mlat=$latitude&mlon=$longitude#map=16/$latitude/$longitude');
    bool canLaunchUrl = await launchUrl(uri, mode: LaunchMode.externalApplication);

    if (!canLaunchUrl) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open map')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double? latitude = assetToDisplay.assetLocation.target?.latitude;
    final double? longitude = assetToDisplay.assetLocation.target?.longitude;
    final bool isLocationAvailable = assetToDisplay.assetLocation.hasValue;

    if (!isLocationAvailable || latitude == null || longitude == null) {
      return Column(children: [
        Row(children: [
          Icon(Icons.location_on, color: Colors.redAccent),
            SizedBox(width: 8),
            Text(
              'Asset location',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
        ]),
        const Text('No location data available!')
      ]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.location_on, color: Colors.redAccent),
            SizedBox(width: 8),
            Text(
              'Asset location',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Latitude: $latitude\nLongitude: $longitude',
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 8),
        AssetButton(
          iconData: Icons.map,
          backgroundColour: Colors.blueAccent,
          foregroundColour: Colors.white,
          buttonText: 'View location in map',
          callback: () async {
            await redirectToMap(context, latitude, longitude);
          }
        )

        // ElevatedButton.icon(
        //   style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
        //   icon: const Icon(Icons.map),
        //   label: const Text('Open in map'),
        //   onPressed: () async {
        //     final uri = Uri.parse(
        //       'https://www.openstreetmap.org/?mlat=$latitude&mlon=$longitude#map=16/$latitude/$longitude',
        //     );

        //     if (!await launchUrl(
        //       uri,
        //       mode: LaunchMode.externalApplication,
        //     )) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(content: Text('Could not open map')),
        //       );
        //     }
        //   },
        // ),
      ],
    );
  }
}
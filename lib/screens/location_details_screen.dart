import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/location.dart';
import '../widgets/common_app_bar.dart';

class LocationDetailsScreen extends StatefulWidget {
  const LocationDetailsScreen({required this.location, super.key});

  final Location location;

  @override
  State<StatefulWidget> createState() => LocationDetailsScreenState();
}

class LocationDetailsScreenState extends State<LocationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 15),
        child: const CommonAppBar(isLeadingIcon: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getChild("TCS Center Name", widget.location.location.toString(),
                const Icon(Icons.location_city)),
            SizedBox.fromSize(
              size: const Size(0, 10),
            ),
            _getChild(
                "Location",
                "${widget.location.geo} - ${widget.location.area}",
                const Icon(Icons.location_on)),
            SizedBox.fromSize(
              size: const Size(0, 10),
            ),
            _getChild("Phone", widget.location.phone.toString(),
                const Icon(Icons.phone)),
            SizedBox.fromSize(
              size: const Size(0, 10),
            ),
            _getChild("Email", widget.location.email.toString(),
                const Icon(Icons.mail_outline)),
            SizedBox.fromSize(
              size: const Size(0, 10),
            ),
            _getChild(
                "Address",
                widget.location.address.toString(),
                null,
                widget.location.geometry!["lat"].toString(),
                widget.location.geometry!["lng"].toString()),
            SizedBox.fromSize(
              size: const Size(0, 10),
            ),
            _getChild(
                "Office Type", widget.location.officeType![0].toString(), null),
          ],
        ),
      ),
    );
  }

  Widget _getChild(
      [String name = "",
      String value = "",
      Icon? icon,
      String? lan,
      String? lat]) {
    return GestureDetector(
      onTap: () {
        _launchActivity(name, value, lan, lat);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          ),
          icon ??
              SizedBox.fromSize(
                size: const Size(0, 0),
              )
        ],
      ),
    );
  }

  Future<void> _launchActivity(
      [String name = "",
      String value = "",
      String? latitude,
      String? longitude]) async {
    Uri? launchUri;
    if (name == "Phone") {
      launchUri = Uri(scheme: 'tel', path: value);
    } else if (name == "Email") {
      launchUri = Uri(scheme: 'mailto', path: value);
    } else if (name == "Address") {
      final String map =
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
      await launchUrl(Uri.parse(map));
    }

    if (launchUri != null) {
      await launchUrl(launchUri);
    }
  }
}

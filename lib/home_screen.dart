import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class Convert extends StatefulWidget {
  const Convert({Key? key}) : super(key: key);

  @override
  State<Convert> createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {
  String stAddress = '', stAdd = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              stAddress,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              stAdd,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                // address to latlng
                List<Location> locations = await locationFromAddress(
                    "City place, Udaipur, Rajasthan");

                List<Placemark> placemarks = await placemarkFromCoordinates(
                    24.57660795105426, 73.68358599858416);

                setState(() {
                  stAddress = locations.last.longitude.toString() +
                      locations.last.latitude.toString();
                  stAdd = placemarks.reversed.last.country.toString() +
                      placemarks.reversed.last.administrativeArea.toString() +
                      placemarks.reversed.last.street.toString() +
                      placemarks.reversed.last.subLocality.toString();
                });
              },
              child: Container(
                height: 60,
                decoration: const BoxDecoration(color: Colors.green),
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: const Center(child: Text("Converter")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

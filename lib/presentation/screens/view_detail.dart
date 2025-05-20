import 'package:country/core/utils/appbar_style.dart';
import 'package:flutter/material.dart';
import '../../features/domain/entities/country_entity.dart';
//import '../models/country.dart'; // adjust path based on your project

class CountryDetailsPage extends StatelessWidget {
  final Country country;

  const CountryDetailsPage({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(country.name),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(country.flagUrl, width: 200, height: 120),
            SizedBox(height: 24),
            Text(
              country.name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Region: ${country.region}',
              style: TextStyle(fontSize: 20),
            ),
            // Add more fields if needed (e.g., population, capital, etc.)
          ],
        ),
      ),
    );
  }
}

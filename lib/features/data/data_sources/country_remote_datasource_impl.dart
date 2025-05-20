

import 'package:flutter/cupertino.dart';

import '../models/country_model.dart';
import 'country_remote_datasource.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  final http.Client client;

  CountryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CountryModel>> searchCountry(String name) async {
    final response = await client.get(
      Uri.parse('https://restcountries.com/v3.1/name/$name'),
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      debugPrint("Country data in remote data source:$data");
      return data.map((json) => CountryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  @override
  Future<List<CountryModel>> loadAllCountries()async {
    final response = await client.get(
      Uri.parse('https://restcountries.com/v3.1/all'),
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      debugPrint("Country data in remote data source:$data");
      return data.map((json) => CountryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
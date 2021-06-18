import 'package:flutter/material.dart';

class CountryInfo {
  String country;
  int totalCases;
  int totalDeaths;

  CountryInfo({
    this.country,
    this.totalCases,
    this.totalDeaths,
  });
}

List<CountryInfo> countries = [
  CountryInfo(country: "India"),
  CountryInfo(country: "Singapore"),
];

List<String> suggestions = [];

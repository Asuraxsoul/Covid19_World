import 'package:flutter/material.dart';

class CountryInfo {
  String country;
  int totalCases, totalDeaths;

  CountryInfo({
    this.country,
    this.totalCases,
    this.totalDeaths,
  });
}

List<CountryInfo> countries = [
  CountryInfo(
    country: "Global",
    totalCases: 25,
    totalDeaths: 15,
  ),
  CountryInfo(
    country: "India",
    totalCases: 25,
    totalDeaths: 15,
  ),
];

List<String> suggestions = [];

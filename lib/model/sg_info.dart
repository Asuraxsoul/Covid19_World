import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SgInfo {
  final String icon, title, status;
  final int numOfCases;
  final Color color;

  SgInfo({
    this.icon,
    this.title,
    this.numOfCases,
    this.color,
    this.status,
  });
}

List sgDetails = [
  SgInfo(
    title: "Total Cases",
    numOfCases: 62315,
    icon: "assets/icons/total.svg",
    color: Colors.white,
    status: "High",
  ),
  SgInfo(
    title:
        "Daily [${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}]",
    numOfCases: 14,
    icon: "assets/icons/daily.svg",
    color: Colors.redAccent,
    status: "Low",
  ),
  SgInfo(
    title: "Recovered",
    numOfCases: 61911,
    icon: "assets/icons/recovered.svg",
    color: Colors.lightBlueAccent,
    status: "High",
  ),
  SgInfo(
    title: "Deaths",
    numOfCases: 34,
    icon: "assets/icons/deaths.svg",
    color: Colors.grey[600],
    status: "Low",
  ),
];

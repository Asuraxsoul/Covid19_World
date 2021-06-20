import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:covid_world/constants.dart';
import 'package:covid_world/components/top_country_card.dart';

class SideDash extends StatefulWidget {
  @override
  _SideDashState createState() => _SideDashState();
}

class _SideDashState extends State<SideDash> {
  Color _color = Colors.redAccent;

  Color blinkingColor() {
    this.setState(() {
      if (_color == Colors.redAccent) {
        _color = Colors.redAccent.withOpacity(0);
      } else {
        _color = Colors.redAccent;
      }

      const oneSecond = const Duration(seconds: 1);
      new Timer.periodic(oneSecond, (Timer t) => setState(() {}));
    });
    return _color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        defaultPadding,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          TopCountryCard(
            country: "GLOBAL",
            countryImage: "assets/icons/globe.svg",
            cases: 175686814,
            deaths: 3803592,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 4),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: blinkingColor(),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, 0),
                  ),
                ]),
                child: Text(
                  "Highest Risk Countries",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          // Chart
          TopCountryCard(
            country: "United States of America",
            countryImage: "assets/icons/america.svg",
            cases: 33132301,
            deaths: 594496,
          ),
          TopCountryCard(
            country: "India",
            countryImage: "assets/icons/india.svg",
            cases: 29510410,
            deaths: 374305,
          ),
          TopCountryCard(
            country: "Brazil",
            countryImage: "assets/icons/brazil.svg",
            cases: 17374818,
            deaths: 486272,
          ),
          SizedBox(height: defaultPadding / 2),
          Container(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "dashboard last updated:\n17 June 2021, 10PM",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white70,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

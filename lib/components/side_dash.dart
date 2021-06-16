import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:covid_world/constants.dart';
import 'package:covid_world/components/top_country_card.dart';

class SideDash extends StatelessWidget {
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
          Text(
            "Highest cases countries",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          // Chart

          TopCountryCard(
            country: "Global",
            countryImage: "assets/icons/globe.svg",
            cases: 175686814,
            deaths: 3803592,
          ),
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
        ],
      ),
    );
  }
}

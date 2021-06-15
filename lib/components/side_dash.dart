import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    startDegreeOffset: -90,
                    sectionsSpace: 0,
                    centerSpaceRadius: 70,
                    sections: [
                      PieChartSectionData(
                        color: Color(0xFF00FFC8),
                        value: 30,
                        showTitle: false,
                        radius: 20,
                      ),
                      PieChartSectionData(
                        color: Color(0xFFFFCF26).withOpacity(0.7),
                        value: 30,
                        showTitle: false,
                        radius: 17,
                      ),
                      PieChartSectionData(
                        color: primaryColor.withOpacity(0.1),
                        value: 40,
                        showTitle: false,
                        radius: 14,
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        "30.0%",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              height: 0.5,
                            ),
                      ),
                      Text("Vaccinated")
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Expected 60% to be vaccinated by September 2021",
              maxLines: 2,
              overflow: TextOverflow.fade,
            ),
          ),
          SizedBox(height: 10),
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

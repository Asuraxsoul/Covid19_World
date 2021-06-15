import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:covid_world/adapt_screen_sizes.dart';
import 'package:covid_world/constants.dart';

import 'package:covid_world/components/header.dart';
import 'package:covid_world/components/side_dash.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Singapore",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          ElevatedButton.icon(
                            icon: Icon(Icons.phonelink_ring_rounded),
                            label: Text(
                              "Get updated news at facebook MOH",
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.all(defaultPadding),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: defaultPadding,
                ),
                Expanded(
                  flex: 2,
                  child: SideDash(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

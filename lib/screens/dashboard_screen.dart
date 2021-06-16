import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:covid_world/model/sg_info.dart';
import 'package:covid_world/constants.dart';

import 'package:covid_world/components/header.dart';
import 'package:covid_world/components/side_dash.dart';
import 'package:covid_world/components/sg_info_card.dart';

import 'package:covid_world/components/line_chart.dart';
import 'package:covid_world/components/orbit.dart';

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
                      SizedBox(height: defaultPadding),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: defaultPadding,
                          childAspectRatio: 1.2,
                        ),
                        itemBuilder: (context, index) =>
                            SgInfoCard(info: sgDetails[index]),
                      ),
                      SizedBox(height: defaultPadding),
                      Container(
                        padding: EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Overall Statistics",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(height: defaultPadding * 0.2),
                            SizedBox(
                              height: defaultPadding * 0.5,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 9,
                                    child: Container(child: SgLineChart())),
                                Expanded(flex: 1, child: Container()),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 191,
                                          child: OrbitingChart(),
                                        ),
                                        Text(
                                          "Expected 60% to be vaccinated by September 2021",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.fade,
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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

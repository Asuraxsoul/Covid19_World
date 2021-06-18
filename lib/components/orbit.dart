import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:covid_world/constants.dart';

class OrbitingChart extends StatefulWidget {
  @override
  _OrbitingChartState createState() => _OrbitingChartState();
}

class _OrbitingChartState extends State<OrbitingChart>
    with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controller2;
  AnimationController controller3;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    controller.repeat(min: 0.0, max: 1.0, period: Duration(milliseconds: 2000));
    controller2 = AnimationController(vsync: this);
    controller2.repeat(
        min: 0.0, max: 1.0, period: Duration(milliseconds: 1750));
    controller3 = AnimationController(vsync: this);
    controller3.repeat(
        min: 0.0, max: 1.0, period: Duration(milliseconds: 1500));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        RotationTransition(
          turns: controller,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 5.0,
              width: 5.0,
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.greenAccent.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.greenAccent.withOpacity(0.8),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(-2, 0),
                    ),
                  ]),
            ),
          ),
        ),
        RotationTransition(
          turns: controller2,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 8.0,
              width: 8.0,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(0.8),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(-5, 0),
                    ),
                  ]),
            ),
          ),
        ),
        RotationTransition(
          turns: controller3,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 4.0,
              width: 4.0,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(-4, 0),
                    ),
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.8),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(-1, 0),
                    ),
                  ]),
            ),
          ),
        ),
        Stack(
          children: [
            PieChart(
              PieChartData(
                startDegreeOffset: -90,
                sectionsSpace: 0,
                centerSpaceRadius: 60,
                sections: [
                  PieChartSectionData(
                    color: Color(0xFF00FFC8),
                    value: 30,
                    showTitle: false,
                    radius: 18,
                  ),
                  PieChartSectionData(
                    color: Color(0xFFFFCF26).withOpacity(0.7),
                    value: 30,
                    showTitle: false,
                    radius: 15,
                  ),
                  PieChartSectionData(
                    color: primaryColor.withOpacity(0.1),
                    value: 40,
                    showTitle: false,
                    radius: 12,
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
                          fontSize: 22,
                        ),
                  ),
                  Text(
                    "Vaccinated",
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

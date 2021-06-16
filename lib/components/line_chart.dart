import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:covid_world/constants.dart';

class SgLineChart extends StatefulWidget {
  @override
  _SgLineChartState createState() => _SgLineChartState();
}

class _SgLineChartState extends State<SgLineChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.95,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(
                  color: Colors.white70.withOpacity(0.1),
                ),
                color: tertiaryColor.withOpacity(0.5)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 14.0, left: 6.0, top: 24, bottom: 4),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
        ),
        Container(
          width: 60,
          height: 34,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: Colors.white54),
          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'Avg',
              style: TextStyle(
                  fontSize: 12,
                  color:
                      showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        topTitles: SideTitles(
          showTitles: true,
          reservedSize: 18,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 10:
                return '21 days period';
            }
            return '';
          },
          margin: -10,
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 18,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 14),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '-21';
              case 7:
                return '-14';
              case 14:
                return '-7';
              case 21:
                return '0';
            }
            return '';
          },
          margin: 5,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 10:
                return '10';
              case 20:
                return '20';
              case 40:
                return '40';
            }
            return '';
          },
          reservedSize: 18,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 21,
      minY: 0,
      maxY: 50,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 45),
            FlSpot(1, 24),
            FlSpot(2, 30),
            FlSpot(3, 33),
            FlSpot(4, 25),
            FlSpot(5, 23),
            FlSpot(6, 18),
            FlSpot(7, 31),
            FlSpot(8, 45),
            FlSpot(9, 13),
            FlSpot(10, 18),
            FlSpot(11, 20),
            FlSpot(12, 14),
            FlSpot(13, 9),
            FlSpot(14, 4),
            FlSpot(15, 13),
            FlSpot(16, 9),
            FlSpot(17, 18),
            FlSpot(18, 13),
            FlSpot(19, 25),
            FlSpot(20, 14),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        topTitles: SideTitles(
          showTitles: true,
          reservedSize: 18,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 10:
                return '18.5 average cases';
            }
            return '';
          },
          margin: -10,
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 18,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 14),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '-21';
              case 7:
                return '-14';
              case 14:
                return '-7';
              case 21:
                return '0';
            }
            return '';
          },
          margin: 5,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 10:
                return '10';
              case 20:
                return '20';
              case 40:
                return '40';
            }
            return '';
          },
          reservedSize: 18,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 21,
      minY: 0,
      maxY: 50,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 18.5),
            FlSpot(1, 18.5),
            FlSpot(2, 18.5),
            FlSpot(3, 18.5),
            FlSpot(4, 18.5),
            FlSpot(5, 18.5),
            FlSpot(6, 18.5),
            FlSpot(7, 18.5),
            FlSpot(8, 18.5),
            FlSpot(9, 18.5),
            FlSpot(10, 18.5),
            FlSpot(11, 18.5),
            FlSpot(12, 18.5),
            FlSpot(13, 18.5),
            FlSpot(14, 18.5),
            FlSpot(15, 18.5),
            FlSpot(16, 18.5),
            FlSpot(17, 18.5),
            FlSpot(18, 18.5),
            FlSpot(19, 18.5),
            FlSpot(20, 18.5),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}

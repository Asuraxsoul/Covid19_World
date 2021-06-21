import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import 'dart:async';

import 'package:covid_world/constants.dart';
import 'package:covid_world/components/top_country_card.dart';

class SideDash extends StatefulWidget {
  @override
  _SideDashState createState() => _SideDashState();
}

class _SideDashState extends State<SideDash> {
//----------------Web Scrape---------------------------------------------------
  bool loaded = false;
  String caseNum = '';
  String url = 'https://worldpopulationreview.com';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final webScraper = WebScraper(url);
    if (await webScraper.loadWebPage('/')) {
      List<Map<String, dynamic>> results =
          webScraper.getElement('div.center', ['title']);
      setState(() {
        loaded = true;
        caseNum = results[0]['title'];
      });
    }
  }
//-----------------------------------------------------------------------------

//----------------Color Blink--------------------------------------------------
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
//-----------------------------------------------------------------------------

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
            country: caseNum,
            countryImage: "assets/icons/globe.svg",
            cases: 175686814,
            deaths: 3803592,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
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
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(color: Colors.white70, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TextButton(
                  child: Text(
                    "Refresh",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  onPressed: () {
                    getData();
                  },
                ),
              ),
            ],
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

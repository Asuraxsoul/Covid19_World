import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid_world/model/sg_info.dart';

import 'package:covid_world/components/sg_info_card.dart';
import 'package:covid_world/components/line_chart.dart';
import 'package:covid_world/components/orbit.dart';

import 'package:covid_world/constants.dart';
import 'package:covid_world/adapt_screen_sizes.dart';

_launchMOHFBURL() async {
  const url = 'https://www.facebook.com/sghealthministry/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Unable to launch $url';
  }
}

class MainDash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Singapore",
              style: TextStyle(
                fontFamily: "Quicksand",
                fontSize: 30,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "dashboard last updated:\n17 June 2021, 10PM",
                textAlign: TextAlign.end,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ),
            SizedBox(width: 20),
            Container(
              width: 310,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.cyanAccent,
                    Colors.greenAccent,
                  ],
                ),
                border: Border.all(
                  width: 2,
                  color: Colors.white54,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ElevatedButton.icon(
                icon: Icon(Icons.phonelink_ring_rounded),
                label: Text(
                  "Get updated news at Facebook MOH",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(defaultPadding),
                  backgroundColor: Colors.white.withOpacity(0),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: tertiaryColor,
                          insetPadding: EdgeInsets.all(defaultPadding),
                          title: Text(
                            "Redirect you to MOH-Facebook?",
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              //fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.pinkAccent,
                            ),
                          ),
                          content: Text(
                            "View most recent Ministry of Health posts on Facebook.",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: new Icon(
                                Icons.exit_to_app_sharp,
                                color: Colors.purpleAccent,
                              ),
                              onPressed: () {
                                _launchMOHFBURL();
                              },
                            ),
                            TextButton(
                              child: new Icon(
                                Icons.done,
                                color: Colors.lightBlueAccent,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
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
            mainAxisSpacing: defaultPadding,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) => SgInfoCard(info: sgDetails[index]),
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
                style: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 20,
                ),
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
                  Expanded(flex: 9, child: Container(child: SgLineChart())),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid_world/constants.dart';

_launchMOHFBURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Unable to launch $url';
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 230,
            child: DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 150,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Care in Isolation",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Quicksand",
                            color: Colors.grey[200],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                          child: SvgPicture.asset(
                            "assets/icons/like.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.3),
            ),
            child: DrawerListTile(
              title: "Dashboard",
              svgSrc: "assets/icons/menu_dashboard.svg",
              press: () {},
            ),
          ),
          DrawerListTile(
            title: "Covid-Explained",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: tertiaryColor,
                      insetPadding: EdgeInsets.all(defaultPadding),
                      title: Text(
                        "What is Covid-19?",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          //fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      content: Text(
                        "View overview, prevention and symptoms about Covid-19 at the World Health Organisation website.",
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
                            _launchMOHFBURL(
                                "https://www.who.int/health-topics/coronavirus#tab=tab_1");
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: new Icon(
                            Icons.ondemand_video,
                            color: Colors.purpleAccent,
                          ),
                          onPressed: () {
                            _launchMOHFBURL(
                                "https://www.youtube.com/watch?v=BtN-goy9VOY");
                            Navigator.of(context).pop();
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
          DrawerListTile(
            title: "Covid-Routines",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: tertiaryColor,
                      insetPadding: EdgeInsets.all(defaultPadding),
                      title: Text(
                        "Covid-19 Posters - MOH resource website",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          //fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      content: Text(
                        "Spread awareness by creating meaningful posters!",
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
                            _launchMOHFBURL(
                                "https://www.moh.gov.sg/covid-19/resources");
                            Navigator.of(context).pop();
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
          DrawerListTile(
            title: "Source/Worldmap",
            svgSrc: "assets/icons/menu_map.svg",
            press: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: tertiaryColor,
                      insetPadding: EdgeInsets.all(defaultPadding),
                      title: Text(
                        "Covid-19 Worldmap and Statistics",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          //fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      content: Text(
                        "View detailed statistics about Covid-19 with worldmap visualization at CNN health website.",
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
                            _launchMOHFBURL(
                                "https://edition.cnn.com/interactive/2020/health/coronavirus-maps-and-cases/");
                            Navigator.of(context).pop();
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
          DrawerListTile(
            title: "More info",
            svgSrc: "assets/icons/menu_info.svg",
            press: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: tertiaryColor,
                      insetPadding: EdgeInsets.all(defaultPadding),
                      title: Text(
                        "View AsuraXSoul github for source code",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          //fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      content: Text(
                        "Enjoy!",
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
                            _launchMOHFBURL(
                                "https://github.com/Asuraxsoul/Covid19_World");
                            Navigator.of(context).pop();
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
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    this.title,
    this.svgSrc,
    this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}

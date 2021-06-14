import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:covid_world/adapt_screen_sizes.dart';
import 'package:covid_world/constants.dart';
import 'package:covid_world/components/glowing_button.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Dashboard",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: secondaryColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      suffixIcon: InkWell(
                        child: Container(
                          padding: EdgeInsets.all(defaultPadding * 0.75),
                          margin: EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: SvgPicture.asset("assets/icons/search.svg"),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: GlowingButton(
                    color1: Colors.pinkAccent,
                    color2: Colors.blueAccent,
                    buttonIcon1: "assets/icons/fire.svg",
                    buttonIcon2: "assets/icons/fire_colorless.svg",
                    buttonText: "Quote-of-the-Day",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

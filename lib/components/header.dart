import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:covid_world/adapt_screen_sizes.dart';
import 'package:covid_world/constants.dart';
import 'package:covid_world/components/glowing_button.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "Covid19 - Dashboard",
          style: TextStyle(
            fontFamily: "ViaodaLibre",
            fontSize: 24,
          ),
        ),
        (AdaptScreenSizes.isDesktop(context) ||
                AdaptScreenSizes.isTablet(context))
            ? Spacer(
                flex: 2,
              )
            : SizedBox(
                width: defaultPadding,
              ),
        Expanded(
          flex: 3,
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
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
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
        // SizedBox(
        //   width: 30,
        // ),
        (AdaptScreenSizes.isDesktop(context) ||
                AdaptScreenSizes.isTablet(context))
            ? Spacer(
                flex: 1,
              )
            : SizedBox(
                width: defaultPadding,
              ),
        Container(
          child: GlowingButton(
            color1: Colors.pinkAccent,
            color2: Colors.indigoAccent,
            buttonIcon1: "assets/icons/fire.svg",
            buttonIcon2: "assets/icons/fire_colorless.svg",
            buttonText: "Quote-of-the-Day",
          ),
        ),
      ],
    );
  }
}

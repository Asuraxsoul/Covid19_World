import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:covid_world/components/glowing_button.dart';
import 'package:covid_world/controllers/menu_controller.dart';
import 'package:covid_world/adapt_screen_sizes.dart';
import 'package:covid_world/constants.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        if (!AdaptScreenSizes.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
          ),
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
        AdaptScreenSizes.isVertMobile(context)
            ? SizedBox.shrink()
            : Expanded(
                flex: 3,
                child: TextField(
                  onChanged: (val) {},
                  controller: controller,
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
            buttonText: AdaptScreenSizes.isVertMobile(context)
                ? "Daily-Quote"
                : "Quote-of-the-Day",
          ),
        ),
      ],
    );
  }
}

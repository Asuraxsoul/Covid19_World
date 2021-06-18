import 'package:covid_world/adapt_screen_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:covid_world/constants.dart';

import 'package:covid_world/components/header.dart';
import 'package:covid_world/components/side_dash.dart';
import 'package:covid_world/components/main_dash.dart';

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
            AdaptScreenSizes.isVertMobile(context)
                ? Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextField(
                          onChanged: (val) {},
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
                                child:
                                    SvgPicture.asset("assets/icons/search.svg"),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                      Expanded(
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
                    ],
                  )
                : SizedBox.shrink(),
            AdaptScreenSizes.isVertMobile(context)
                ? SizedBox(height: defaultPadding)
                : SizedBox.shrink(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: MainDash(),
                ),
                (AdaptScreenSizes.isDesktop(context) ||
                        AdaptScreenSizes.isTablet(context))
                    ? SizedBox(
                        width: defaultPadding,
                      )
                    : SizedBox.shrink(),
                (AdaptScreenSizes.isDesktop(context) ||
                        AdaptScreenSizes.isTablet(context))
                    ? Expanded(
                        flex: 2,
                        child: SideDash(),
                      )
                    : SizedBox.shrink(),
              ],
            ),
            (AdaptScreenSizes.isDesktop(context) ||
                    AdaptScreenSizes.isTablet(context))
                ? SizedBox.shrink()
                : SizedBox(height: defaultPadding),
            (AdaptScreenSizes.isDesktop(context) ||
                    AdaptScreenSizes.isTablet(context))
                ? SizedBox.shrink()
                : SideDash(),
          ],
        ),
      ),
    );
  }
}

import 'package:covid_world/adapt_screen_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:covid_world/constants.dart';
import 'package:covid_world/adapt_screen_sizes.dart';

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
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:covid_world/constants.dart';

class TopCountryCard extends StatefulWidget {
  final String country;
  final String countryImage;
  final int cases;
  final int deaths;

  const TopCountryCard({
    Key key,
    this.country,
    this.countryImage,
    this.cases,
    this.deaths,
  }) : super(key: key);

  @override
  _TopCountryCardState createState() => _TopCountryCardState();
}

class _TopCountryCardState extends State<TopCountryCard> {
  final formatter = new NumberFormat("###,###,###,###");

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultPadding / 2),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: primaryColor.withOpacity(0.15),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.pinkAccent.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: SvgPicture.asset(widget.countryImage),
          ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.country,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    formatter.format(widget.cases),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "confirmed cases",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.white70),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatter.format(widget.deaths),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "deaths",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.white70),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ],
      ),
    );
  }
}

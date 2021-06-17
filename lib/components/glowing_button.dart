import 'package:covid_world/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:covid_world/model/quotes.dart';

class GlowingButton extends StatefulWidget {
  final Color color1;
  final Color color2;
  final String buttonIcon1;
  final String buttonIcon2;
  final String buttonText;

  const GlowingButton({
    Key key,
    this.color1,
    this.color2,
    this.buttonIcon1,
    this.buttonIcon2,
    this.buttonText,
  }) : super(key: key);

  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  var isGlowing = false;
  var scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapUp: (val) {
          setState(() {
            isGlowing = false;
            scale = 1.0;
          });
        },
        onTapDown: (val) {
          setState(() {
            isGlowing = true;
            scale = 1.05;
          });
        },
        onTapCancel: () {
          setState(() {
            isGlowing = false;
            scale = 1.05;
          });
        },
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: tertiaryColor,
                  insetPadding: EdgeInsets.all(defaultPadding),
                  title: Text(
                    "Quote of the Day!",
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      //fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  content: Text(
                    Quote.getQuote(),
                    style: TextStyle(
                      fontFamily: 'ViaodaLibre',
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      letterSpacing: 2,
                    ),
                  ),
                  actions: <Widget>[
                    Text(
                      "By ${Quote.getAuthor()}",
                      style: TextStyle(
                        fontFamily: 'CormorantGaramond',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
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
        child: AnimatedContainer(
          transform: Matrix4.identity()..scale(scale),
          padding: EdgeInsets.all(8.0),
          duration: Duration(milliseconds: 100),
          height: 48,
          width: 175,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white54,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              gradient: LinearGradient(
                colors: [
                  widget.color1,
                  widget.color2,
                ],
              ),
              boxShadow: isGlowing
                  ? [
                      BoxShadow(
                        color: widget.color1.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(-8, 0),
                      ),
                      BoxShadow(
                        color: widget.color2.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(8, 0),
                      ),
                      BoxShadow(
                        color: widget.color1.withOpacity(0.2),
                        spreadRadius: 8,
                        blurRadius: 16,
                        offset: Offset(-8, 0),
                      ),
                      BoxShadow(
                        color: widget.color2.withOpacity(0.2),
                        spreadRadius: 8,
                        blurRadius: 16,
                        offset: Offset(8, 0),
                      ),
                    ]
                  : []),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                child: SvgPicture.asset(
                  isGlowing ? widget.buttonIcon1 : widget.buttonIcon2,
                  height: 20,
                  width: 20,
                ),
              ),
              Text(
                widget.buttonText,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Quicksand",
                  fontWeight: FontWeight.bold,
                  color: isGlowing ? Colors.white : Colors.grey[100],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

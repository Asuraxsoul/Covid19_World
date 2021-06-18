import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

import 'package:covid_world/adapt_screen_sizes.dart';
import 'package:covid_world/constants.dart';
import 'package:covid_world/components/glowing_button.dart';

import 'package:covid_world/controllers/menu_controller.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  TextEditingController controller = TextEditingController();

  List<String> added = [];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  _FirstPageState() {
    textField = SimpleAutoCompleteTextField(
      key: key,
      decoration: new InputDecoration(errorText: "Beans"),
      controller: TextEditingController(text: "Starting Text"),
      suggestions: suggestions,
      textChanged: (text) => currentText = text,
      clearOnSubmit: true,
      textSubmitted: (text) => setState(() {
        if (text != "") {
          added.add(text);
        }
      }),
    );
  }

  List<String> suggestions = [
    "Apple",
    "Armidillo",
    "Actual",
    "Actuary",
    "America",
    "Argentina",
    "Australia",
    "Antarctica",
    "Blueberry",
    "Cheese",
    "Danish",
    "Eclair",
    "Fudge",
    "Granola",
    "Hazelnut",
    "Ice Cream",
    "Jely",
    "Kiwi Fruit",
    "Lamb",
    "Macadamia",
    "Nachos",
    "Oatmeal",
    "Palm Oil",
    "Quail",
    "Rabbit",
    "Salad",
    "T-Bone Steak",
    "Urid Dal",
    "Vanilla",
    "Waffles",
    "Yam",
    "Zest"
  ];

  SimpleAutoCompleteTextField textField;
  bool showWhichErrorText = false;

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
            buttonText: "Quote-of-the-Day",
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:geek_task/util/color_palette.dart';
import 'package:geek_task/util/dimensions.dart';

//for header text
final headerText_1 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: Dimensions.fontSizeDefault,
);

final headerText_2 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: Dimensions.fontSizeDefault,
);

//for body text
final bodyText_1 = TextStyle(
  color: Palette.grey,
  fontSize: Dimensions.fontSizeDefault,
);

final bodyText_2 = TextStyle(
  color: Palette.grey,
  fontSize: Dimensions.fontSizeDefault,
);

final bodyText_3 = TextStyle(
  color: Palette.white,
  fontSize: Dimensions.fontSizeDefault,
);
final bodyText_4 = TextStyle(
  color: Palette.white,
  fontSize: Dimensions.fontSizeDefault,
);

final kSearchFieldDecoration = InputDecoration(
    hintText: 'Search Events',alignLabelWithHint: true,
    hintStyle: bodyText_3,
    filled: true,
    //contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    fillColor: Palette.lightBlue,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xff535354), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    prefixIcon: Icon(
      Icons.search,
      color: Palette.white,
    ),
    suffixIcon: Icon(
      Icons.cancel,
      color: Palette.white,
    ));

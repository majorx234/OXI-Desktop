import 'package:flutter/material.dart';

final oxiTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.white70,
        fontSize: 22.0,
        fontWeight: FontWeight.w100
      ),
      headline2: TextStyle(
        color: Colors.white70,
        fontSize: 22.0,
        fontWeight: FontWeight.w100
      ),
      bodyText1: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w100
      ),
      bodyText2: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w100
      )
    ),
    // buttonTheme: ButtonThemeData(
    //
    // ),
    outlinedButtonTheme: OutlinedButtonThemeData (
      style: OutlinedButton.styleFrom (
        textStyle: TextStyle(
          color: Color(0xfff0f0f8),
          fontWeight: FontWeight.w100,
        ),
        shape: ContinuousRectangleBorder(
          side: BorderSide(
            color: Color(0xffffffff),
            width: 9,
            style: BorderStyle.solid
          ),
          // borderRadius: BorderRadius.zero
        )
      )
    )
);

AppBar OxiAppBar ({
  required Text title,
  bool disableNav = false
}) {
  return AppBar (
    title: title,
    actions: [
      IconButton(onPressed: null, icon: Icon(Icons.settings))
    ],
    centerTitle: true,
    automaticallyImplyLeading: !disableNav,
    toolbarHeight: 76,
    bottom: PreferredSize(
      preferredSize: Size(double.infinity, 5.0),
      child: Container(
        height: 2.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffa84eaf), Color(0xff7baefb)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            )
        ),
      ),
    ),
  );
}
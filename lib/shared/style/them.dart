import 'package:flutter/material.dart';

import 'color.dart';

ThemeData lightthem = ThemeData(
  iconTheme: IconThemeData(
    color: Colors.black,

  ),
bottomNavigationBarTheme:BottomNavigationBarThemeData(
  type: BottomNavigationBarType.fixed,

  selectedItemColor: Colors.orange,
  unselectedItemColor: Colors.grey,
  enableFeedback: false,




) ,
  primarySwatch: defoltcolor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(

      backgroundColor: Colors.orange
    ),
    scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0.0
  ),
textTheme: TextTheme(
  headline4: TextStyle(
    color: Colors.black
  )
)
);

ThemeData darkthem = ThemeData(

    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0.0
    ),
    textTheme: TextTheme(
        headline4: TextStyle(
            color: Colors.white
        )
    )
);
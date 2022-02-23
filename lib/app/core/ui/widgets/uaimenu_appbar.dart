import 'package:flutter/material.dart';

class UaimenuAppbar extends AppBar {
  UaimenuAppbar({
    Key? key,
    double elevation = 2,
  }) : super(
          key: key,
          backgroundColor: Colors.white,
          elevation: elevation,
          centerTitle: true,
          title: Image.asset(
            'assets/images/lo12.jpg',
            width: 62,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        );
}

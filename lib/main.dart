import 'package:flutter/material.dart';
import './additem.dart';
import './display.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        body: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: <Widget>[
            DisplayItem(),
            AddItem(),
          ],
        ),
      ),
    );
  }
}

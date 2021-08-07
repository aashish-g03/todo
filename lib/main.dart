import 'package:flutter/material.dart';
import './additem.dart';
import './display.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pagecontroller.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  int bottomSelectedIndex = 0;
  final PageController pagecontroller = PageController(initialPage: 0);

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        body: PageView(
          scrollDirection: Axis.horizontal,
          controller: pagecontroller,
          onPageChanged: (index) {
            pageChanged(index);
          },
          children: <Widget>[
            DisplayItem(),
            AddItem(),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: bottomSelectedIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.list, size: 20),
            Icon(Icons.add, size: 20),
          ],
          color: Colors.blueAccent,
          buttonBackgroundColor: Colors.blueAccent[100],
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            bottomTapped(index);
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}

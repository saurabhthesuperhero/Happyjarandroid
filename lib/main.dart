import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

final String assetName = 'assets/images/smiley.svg';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy Jar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(69, 182, 73, 1),
                Color.fromRGBO(46, 196, 182, 1)
              ]),
        ),
        child: Stack(children: <Widget>[]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildShowModalBottomSheet(context);
        },
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.add,
          ),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            gradient: new RadialGradient(
              colors: [Colors.orange, Color(0xFFF500).withOpacity(0.5)],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.4,
                  1
                ],
                colors: [
                  Color.fromRGBO(69, 182, 73, 1),
                  Color.fromRGBO(46, 196, 182, 1)
                ]),
          ),
          height: 500,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 80),
              Text(
                'What made you Happy today?',
                style: GoogleFonts.alice(color: Colors.white, fontSize: 22),
              ),
              Image.asset("assets/images/Smiley.png"),
              // SvgPicture.asset(assetName, semanticsLabel: 'Empty state'),
            ],
          ),
        );
      },
    );
  }
}

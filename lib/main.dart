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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();

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
        return Stack(
          alignment: Alignment.topCenter, // Center of Top
          fit: StackFit.expand,

          children: <Widget>[
            Container(
              child: Image.asset("assets/images/Smiley.png"),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
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
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.all(40),
                    child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: 'I realize my worth..today',
                            hintStyle: GoogleFonts.alice(color: Colors.white)),
                        onChanged: (text) {
                          setState(() {
                            // fullName = text;
                            //you can access nameController in its scope to get
                            // the value of text entered as shown below
                            //fullName = nameController.text;
                          });
                        }),
                  ),
                  RaisedButton(
                    color: Color.fromRGBO(46, 196, 182, 1),
                    textColor: Colors.white,
                    child: Text('Put in Jar'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeelingScreen()),
                      );
                    },
                  ),
                  // SvgPicture.asset(assetName, semanticsLabel: 'Empty state'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class Jardone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center //Center Column contents vertically,
              ,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,

                  children: [
                    Image.asset(
                      "assets/images/jar.png",
                      width: 200,
                      height: 400,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Row contents horizontally,

                  children: [
                    Text(
                      'Memory added Successfully',
                      style: GoogleFonts.alice(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

class FeelingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 26.0),
                        child: Text(
                          'How was the Overall Feeling?',
                          style: GoogleFonts.alice(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  //Creates even space between each item and their parent container
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset("assets/images/blessemo.png"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Jardone()),
                        );
                      },
                    ),
                    GestureDetector(
                      child: Image.asset("assets/images/lovelyemo.png"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Jardone()),
                        );
                      },
                    ),
                    GestureDetector(
                      child: Image.asset("assets/images/proudemo.png"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Jardone()),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  //Creates even space between each item and their parent container
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Blessed',
                      style: GoogleFonts.alice(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Loved',
                      style: GoogleFonts.alice(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Proud',
                      style: GoogleFonts.alice(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  //Creates even space between each item and their parent container
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                        child: Image.asset("assets/images/crazyemo.png"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Jardone()),
                          );
                        }),
                    GestureDetector(
                        child: Image.asset("assets/images/celebratemo.png"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Jardone()),
                          );
                        }),
                    GestureDetector(
                        child: Image.asset("assets/images/awesomeemo.png"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Jardone()),
                          );
                        }),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  //Creates even space between each item and their parent container
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Crazy',
                      style: GoogleFonts.alice(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Celebration',
                      style: GoogleFonts.alice(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Awesome',
                      style: GoogleFonts.alice(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  //Creates even space between each item and their parent container
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                        child: Image.asset("assets/images/funnyemo.png"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Jardone()),
                          );
                        }),
                    GestureDetector(
                        child: Image.asset("assets/images/nowordsemo.png"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Jardone()),
                          );
                        }),
                    GestureDetector(
                        child: Image.asset("assets/images/beautifulemo.png"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Jardone()),
                          );
                        }),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  //Creates even space between each item and their parent container
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Funny',
                      style: GoogleFonts.alice(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'No words',
                      style: GoogleFonts.alice(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Beautiful',
                      style: GoogleFonts.alice(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
              ]),
        ),
      ),
    );
  }
}

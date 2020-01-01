import 'package:flutter/material.dart';
import 'package:timer/calculator.dart';
import 'package:timer/main.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  double height;
  var selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose operation to perform'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                child: AnimatedContainer(
                  padding: EdgeInsets.all(30),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            child: Text(
                              'Calculate your BMI',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CalculatorPage()));
                            },
                            child: Text(
                              'Arithmetic Calculator',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  height: selected ? 603 : 0.0,
                  duration: Duration(seconds: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/beautiful_pattern.jpg'))),
                ),
              ),
            ),
            Expanded(
                          child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(
                        0.8, 0.0), // 10% of the width, so there are ten blinds.
                    colors: [
                      const Color(0xf0b69),
                      Colors.blueAccent
                    ], // whitish to gray
                    tileMode:
                        TileMode.repeated, // repeats the gradient over the canvas
                  ),
                ),
                child: Center(
                  heightFactor: 20,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = !selected;
                        });
                      },
                      child: Text(
                        'Tap to begin',
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/**
 *Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 0,
                child: FlatButton(
                  padding: EdgeInsets.all(25),
                  shape: OutlineInputBorder(borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    'Calculate your BMI',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 0,
                child: FlatButton(
                  padding: EdgeInsets.all(25),
                  shape: OutlineInputBorder(borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CalculatorPage()));
                  },
                  child: Text(
                    'Arithmetic Calculator',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ), 
 * 
 */

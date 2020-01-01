import 'package:flutter/material.dart';
import 'package:timer/calculator.dart';
import 'package:timer/main.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: Text('Choose operation to perform'),
      ),
      body: Center(
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
    );
  }
}

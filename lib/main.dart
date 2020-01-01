

import 'package:flutter/material.dart';
import 'package:timer/calculator.dart';
import 'package:timer/introscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  int weight, height;
  String displayResult = '';
  calcBMI() {
    weight = int.parse(controller1.text);
    height = int.parse(controller2.text);
    var BMI = weight / height * height;

    if (BMI < 18.5) {
      return 'Your BMI is: ' +
          BMI.toString() +
          '\nunderweight\npls consult your doctor';
    } else if (BMI >= 18.5 || BMI <= 24.9) {
      return 'Your BMI is: ' + BMI.toString() + '\nNormal Weight\nKeep it up';
    } else if (BMI >= 25.0 || BMI <= 29.9) {
      return 'Your BMI is: ' +
          BMI.toString() +
          '\nOverweight\npls consult your doctor';
    } else {
      return 'Your BMI is: ' +
          BMI.toString() +
          '\nObesity\npls consult your doctor';
    }
  }

 void reset() {
    controller1.text = '';
    controller2.text = '';
    displayResult = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'pls enter some value';
                    }
                  },
                  controller: controller1,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'enter weight in kg',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.2))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (val){
                    if (val.isEmpty) {
                      return 'pls enter some value';
                    }
                  },
                  controller: controller2,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'enter height in m',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.2))),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(padding: EdgeInsets.all(20),
                      color: Colors.blue,
                      shape: OutlineInputBorder(borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        setState(() {
                          if (formKey.currentState.validate()) {
                            this.displayResult = calcBMI();
                          }
                        });
                      },
                      child: Text(
                        'CALCULATE',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FlatButton(padding: EdgeInsets.all(20),
                      color: Colors.blue,
                      shape: OutlineInputBorder(borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        setState(() {
                          reset();
                        });
                      },
                      child: Text(
                        'RESET',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Expanded(
                    child: Container(
                  child: Text(
                    displayResult,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  buildBtn(String btnText) {
    return Row(
      children: <Widget>[
        OutlineButton(
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            buildBtn(''),
            buildBtn(''),
            buildBtn(''),
            buildBtn('')
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int num1, num2;
  String result = '';
  String displaytext = '';
  String performOperation;
  

  operation(String btnText) {
    if (btnText == 'CLEAR') {
      result = '';
      num1 = 0;
      num2 = 0;
      displaytext = '';
    } else if (btnText == '/' ||
        btnText == '*' ||
        btnText == '-' ||
        btnText == '+') {
      num1 = int.parse(displaytext);
      result = '';
      performOperation = btnText;
    } else if (btnText == '=') {
      num2 = int.parse(displaytext);
      if (performOperation == '+') {
        result = (num1 + num2).toString();
      }
      if (performOperation == '/') {
        result = (num1 / num2).toString();
      }
      if (performOperation == '*') {
        result = (num1 * num2).toString();
      }
      if (performOperation == '-') {
        result = (num1 - num2).toString();
      }
    }else{
      result = int.parse(displaytext + btnText).toString();
    }
    setState(() {
      displaytext= result;
    

    });
  }

  buildBtn(String text,[Color color]) {
    return Expanded(
      child: OutlineButton(color: Colors.grey,splashColor: Colors.blue,
        padding: EdgeInsets.all(25),borderSide: BorderSide(color: Colors.grey),
        onPressed: () => operation(text),
        child: Text(
          text,
          style: TextStyle(color: Colors.white,
            fontSize: 25.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black38,
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(10),
                child: Text(
                  result,
                  style: TextStyle(color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                children: <Widget>[
                  buildBtn('+'),
                  buildBtn('CLEAR'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildBtn('7'),
                  buildBtn('8'),
                  buildBtn('9'),
                  buildBtn('/')
                ],
              ),
              Row(
                children: <Widget>[
                  buildBtn('4'),
                  buildBtn('5'),
                  buildBtn('6'),
                  buildBtn('*')
                ],
              ),
              Row(
                children: <Widget>[
                  buildBtn('1'),
                  buildBtn('2'),
                  buildBtn('3'),
                  buildBtn('-')
                ],
              ),
              Row(
                children: <Widget>[buildBtn('0'), buildBtn('=')],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(
        title: "Calculator",
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30),
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.all(10),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                customoutlinebutton('7'),
                customoutlinebutton('8'),
                customoutlinebutton('9'),
                customoutlinebutton('/'),
              ],
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                customoutlinebutton('4'),
                customoutlinebutton('5'),
                customoutlinebutton('6'),
                customoutlinebutton('x'),
              ],
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                customoutlinebutton('1'),
                customoutlinebutton('2'),
                customoutlinebutton('3'),
                customoutlinebutton('-'),
              ],
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                customoutlinebutton('.'),
                customoutlinebutton('0'),
                customoutlinebutton('00'),
                customoutlinebutton('+'),
              ],
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                customoutlinebutton('CLEAR'),
                customoutlinebutton('='),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget customoutlinebutton(String val) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        child: OutlinedButton(
          onPressed: () => btnclicked(val),
          child: Text(
            val,
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }

  late String res, text = "";
  var first;
  var second;
  String? opp;

  void btnclicked(String btntxt) {
    res = text + btntxt;
    if (btntxt == "CLEAR") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btntxt == "+" ||
        btntxt == "-" ||
        btntxt == "x" ||
        btntxt == "/") {
      first = int.parse(text);
      res = "";
      opp = btntxt;
    } else if (btntxt == "=") {
      second = int.parse(text);

      if (opp == "+") {
        res = (first! + second!).toString();
      }
      if (opp == "-") {
        res = (first! - second!).toString();
      }
      if (opp == "x") {
        res = (first! * second!).toString();
      }
      if (opp == "/") {
        res = (first! / second!).toString();
      }
    } else {
      res = int.parse(text + btntxt).toString();
    }

    setState(() {
      text = res;
    });
  }
}

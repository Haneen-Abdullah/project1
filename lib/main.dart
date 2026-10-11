import 'dart:math';
import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "playDice",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
      ),
      home: playDice(),
    );
  }
}

class playDice extends StatefulWidget {
  @override
  State<playDice> createState() => playDiceState();
}

class playDiceState extends State<playDice> {
  int value_1 = 1;
  int value_2 = 1;
  int total = 2;

  String imagePath = 'assets/sad.png';

  void reset() {
    setState(() {
      value_1 = 1;
      value_2 = 1;
      total = 2;
      imagePath = 'assets/sad.png';
    });
  }

  void roll() {
    setState(() {
      value_1 = Random().nextInt(6) + 1;
      value_2 = Random().nextInt(6) + 1;
      total = value_1 + value_2;
      if (total >= 10) {
      imagePath = 'assets/happy.png';
      } else {
      imagePath = 'assets/sad.png';
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('play dice'),
        centerTitle: true,
        leading: Icon(Icons.casino),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              SizedBox(height: 20),

      Text(
      "total is $total",
          style: TextStyle(fontSize: 20),
    ),

    SizedBox(height: 40),

    Image.asset(
    imagePath,
    width: 200,
    height: 150,
    ),

    SizedBox(height: 40),

    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Dice(value: value_1),
    Dice(value: value_2),
    ],
    ),

    SizedBox(height: 30),

    Row(
    children: [
    Expanded(
    child: ElevatedButton(
    onPressed: roll,
    child: Text("Roll"),
    ),
    ),

    SizedBox(width: 30),

    Expanded(
    child: ElevatedButton(
    onPressed: reset,
    child: Text("Reset"),
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    );

    }
}

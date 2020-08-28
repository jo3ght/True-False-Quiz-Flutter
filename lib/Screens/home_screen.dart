import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Your score: $score"),
                SizedBox(height: 32),
                Text(
                  "This is the question",
                  style: TextStyle(fontSize: 30),
                ),
                MaterialButton(
                  child: Text(
                    "True",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  minWidth: 200,
                  height: 60,
                  color: Colors.green,
                  onPressed: () {},
                ),
                MaterialButton(
                  child: Text(
                    "False",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  minWidth: 200,
                  height: 60,
                  color: Colors.red,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

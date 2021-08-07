import 'package:flutter/material.dart';
import 'package:flutter_twenty_twenty/twenty_twenty.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey twentyKey = GlobalKey();
  double horizontalPosition = 0.0;
  double value = 50.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        color: Colors.blueGrey,
        child: Center(
          child: SizedBox(
            height: size.height * 0.3,
            child: SizedBox(
              width: size.width * 0.8,
              child: TwentyTwenty(
                key: twentyKey,
                defaulPostion: 0.7,
                firstChild: Container(color: Colors.red),
                secondeChild: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://i1.wp.com/angularscript.com/wp-content/uploads/2018/06/Progressively-Loading-Images-With-Blur-Effect-min.png"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

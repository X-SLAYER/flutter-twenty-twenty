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
                handleColor: Colors.white,
                firstChild: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://d33wubrfki0l68.cloudfront.net/b3df57665d1b6eca0bb5ade611ba19a5439cdc70/f5820/playground/uploads/upload/upload/28/sample-after.png"),
                ),
                secondeChild: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://d33wubrfki0l68.cloudfront.net/b3df57665d1b6eca0bb5ade611ba19a5439cdc70/f5820/playground/uploads/upload/upload/28/sample-after.png"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

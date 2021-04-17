import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF000000),
      body: Center(
        child: Container(
          //margin: EdgeInsets.all(105),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('VACANTA', style: TextStyle(fontSize: 40, color: Color(0xFFFF5500)),),
              LinearProgressIndicator(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              )
            ],
        ),)
      ),
    );
  }
}

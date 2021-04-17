import 'package:flutter/material.dart';
import 'package:vacanta/profile.dart';
import 'package:vacanta/register_page.dart';
import 'message_pages.dart';
import 'load_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      darkTheme: ThemeData(),
      initialRoute: '/loading',
      routes: {
        '/' : (context) => MyHomePage(),
        '/loading' : (context) => LoadingPage(),
        '/register' : (context) => RegisterPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  int count = 0;

  List<Widget> appBars = [
    AppBar(),
    null,
    AppBar(title: Text('appBars'),)
  ];

  List<Widget> bodys = [
    Text('first page'),
    HomeMessage(),
    ProfilePage()
  ];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBars[widget.count],
      body: widget.bodys[widget.count],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.count,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF6200EE),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        onTap: (val){setState(() {
          widget.count = val;
        });},
      ),
    );
  }
}

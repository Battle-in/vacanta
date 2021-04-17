import 'package:flutter/material.dart';

class HomeMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SelectChatElem('label', Icon(Icons.account_circle_rounded, size: 60,), '/')
        ],
      ),
    );
  }
}

class SelectChatElem extends StatelessWidget {
  String label;
  Icon icon;
  String route;

  SelectChatElem(this.label, this.icon, this.route);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            CircleAvatar(
              minRadius: 20,
              maxRadius: 50,
              child: icon,
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(label, style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
      onTap: (){Navigator.pushNamed(context, route);},
    );
  }
}

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

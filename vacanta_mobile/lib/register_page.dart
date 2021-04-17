import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  String firstName;
  String lastName;
  String patrinomic;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text('Register'),),
          SliverList(delegate:
          SliverChildListDelegate([
            TextPadding('ФИО'),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Имя',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Фамилия',
                ),
                onSaved: (String value) {
                  print(value);
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (val){
                  print(val);
                  return (val == 'test') ? 'fuck' : null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Отчество',
                ),
              )
            ),
            TextPadding('Описание'),

          ])
          )
        ],
      ),
    );
  }
}

class TextPadding extends StatelessWidget {
  String title;

  TextPadding(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 25, color: Theme.of(context).primaryColor),),
          Container(
            height: 5,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}

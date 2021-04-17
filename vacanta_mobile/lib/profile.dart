import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            //Блок с аватаром и юзернеймом
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(minRadius: 30, maxRadius: 50,),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        Text('User Name', style: TextStyle(fontSize: 30),),
                        Text('profecional')
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Конец блока
            NavElem('к загрузке', '/loading', Icon(Icons.refresh)),
            NavElem('регистрация', '/register', Icon(Icons.account_circle_rounded))
          ],
        ),
      )
    );
  }
}

class NavElem extends StatelessWidget {
  Icon icon;
  String title;
  String rout;

  NavElem(this.title,this.rout, this.icon);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Row(
          children: [
            icon,
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(title),
            )
          ],
        ),
      ),
      onTap: (){Navigator.pushNamed(context, rout);},
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/switch.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.green,),
              onPressed: () {
                print("menu button is clicked");
              }
          ),
          // title: IconButton(
          //   onPressed: () { print("이미지버튼 동작"); },
          //   icon: Image.asset('assets/images/Slimer_by_shinrider-dcqaiza.webp')),
          title: GestureDetector(
            onTap: () {print('click on edit');},
            child: Image(
              image: AssetImage('assets/images/ezgif.com-gif-maker.png'),
              fit: BoxFit.cover,
              height: 40,
            ),
          ),
          //   title: Image.asset('assets/images/ezgif.com-gif-maker.png',
          //         fit: BoxFit.cover,
          //         height: 20,
          //       )

        ),

        body: Container(
          child: Row(
            children: [
              Expanded(child: Container(
                height: 100,
                color: Colors.lightGreenAccent,
                child: Text("Hi, Lynn",
                  style: TextStyle(fontSize: 30),
                ),
              ), flex: 6,),
              Expanded(child: Container(
                height: 100,
                color: Colors.blue,
                child: const MyStatefulWidget()
              ), flex: 4,)
            ],
          ),
        )
    );
  }
}

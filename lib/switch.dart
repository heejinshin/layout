import 'package:flutter/material.dart';

// class Switch extends StatelessWidget {
//   const Switch({Key? key}) : super(key: key);
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       child(
// //         Row(
// //           children: [],
// //         )
// //       )
// //     );
// //   }
// // }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Switch(
            value: isSwitched,
            onChanged: (value){
              setState((){
                isSwitched = value;
              });
            },
          ),
        ],
      ),
    );
  }

@override
void checkSwitch() async {
    if(isSwitched==true){
      // return  ---> lockscrenPage를 local 홈화면에 active 한다.
    }
}
}



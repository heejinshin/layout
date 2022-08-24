import 'package:flutter/material.dart';
import 'package:layout/main.dart';
import 'package:layout/Home.dart';



class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 2000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        child:
          Center(child:
          Text("Argos", style: TextStyle(
              color: Colors.lightGreenAccent, fontSize: 50),)),

          //   Icon.Icons() // blink eyes

        // child: Image(
                  // image: AssetImage('assets/images/ezgif.com-gif-maker.png'),
                  // height: 10,
        )

    );
  }

}

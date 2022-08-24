import 'package:flutter/material.dart';
import 'package:layout/switch.dart';

import 'package:layout/lockScreen//secondpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: FingerprintApp(),
));

class FingerprintApp extends StatefulWidget {
  const FingerprintApp({Key? key}) : super(key: key);

  @override
  State<FingerprintApp> createState() => _FingerprintAppState();
}


class _FingerprintAppState extends State<FingerprintApp> {
  LocalAuthentication auth = LocalAuthentication();
  late bool _canCheckBiometric;
  late List<BiometricType> _availableBiometrics; // this list will store all types
  //of biometric sensor like face, finger...
  String autherized = "Not autherized"; // this String will check if we can
//access our app or not



  // Now, create the function that will allow uus to check our biometric sensors
  Future<void> _checkBiometric() async{
    bool canCheckBiometric;
    try{
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch(e) {
      print(e);
    }
    if(!mounted) return;
    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  //now that we checked if we are allowed to check our biometric lets get
  // the availanle biometrics sensor on our device
  void _getAvailableBiometrics() async{

    List<BiometricType> availableBiometric;

    try{

      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch(e) {
      print(e);
    }

    if(!mounted) return;
    setState(() {
      _availableBiometric = availableBiometric
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;

    try{
      authenticated = await auth.authenticate(
        localizedReason: "Scan your finger to autrhentie",
        // useErrorDialogs: true,
        // stickAuth: false
      );
    }on PlatformException catch(e) {
      print(e);
    }

    if(!mounted) return;

    setState(() {
      //here we can add what our app will do if the user authenticated first
      autherized = authenticated ? "Autherized success" : "Failed to authenticate";
      if(authenticated) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
      }
      print(autherized);
      // note that you must configure your device  and add a finger print
    });
  }
  //before we test our app we should first initate the state and call
  // our tow first function

  @override
  void initState() {
    //TOdo: implement initstate
    _checkBiometric();
    _getAvailableBiometrics();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xfFF3C3E52),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text("Login,", style: TextStyle(
                        color: Colors.white,
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 50.0),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/fingerprint.webp',
                          width: 120.0,
                        ),
                        Text("FingerPrint auth", style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),),
                        Container(
                          width: 150.0,
                          child: Text("Authenticate using your fingerprint instead of your password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                height: 1.5
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _authenticate,
                            elevation: 0.0,
                            color: Color(0xFfF04A5ED),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),

                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
                              child: Text("Autentic", style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}




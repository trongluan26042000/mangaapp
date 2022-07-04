import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mangaapp/ui/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
bool _isVisible = false;
  _SplashScreenState(){
    Timer(const Duration(milliseconds: 2000),(){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
      });
    });

    Timer(
      const Duration(milliseconds: 10),(){
        setState(() {
          _isVisible = true;
        });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Theme.of(context).errorColor, Theme.of(context).errorColor],
            begin: const FractionalOffset(0,0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0,1.0],
            tileMode: TileMode.clamp,
        ),
      ),
      child:  AnimatedOpacity(
        opacity: _isVisible? 1.0 : 0,
        duration: const Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 140.0,
            width: 140.0,
            child: Center(
              child: ClipOval(
                child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Netflix_icon.svg/1200px-Netflix_icon.svg.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

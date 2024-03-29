import 'dart:async';

import 'package:reportes/screen/loginScreen.dart';
import 'package:reportes/screen/homeScreen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), _onShowLogin);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> _onShowLogin()  async  {
     String session = await storage.read(key: 'user');
    if(mounted){
      if(session?.isEmpty == false){
        print("Cargando sesion");
        Navigator.of(context).pushReplacement(HomeScreen.route(session));
      }else{
        print("Cargando login");
        Navigator.of(context).pushReplacement(LoginScreen.route());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[600],
      child: Column(
        children: <Widget>[
          SizedBox(height: 100.0,),
          Flexible(
            flex: 2,
            child: SafeArea(
              child: FractionallySizedBox(
                widthFactor: 0.7,
                child: Image.asset('assets/empty.jpg'),
              ),
            ),
          ),
          Text(
            'Bienvenido',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Flexible(
            flex: 2,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

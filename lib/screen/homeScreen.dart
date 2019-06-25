import 'package:flutter/material.dart';
import 'dart:async';
import 'loginScreen.dart';

import 'package:reportes/bloc/navigation_bloc.dart';
import 'package:reportes/screen/createReportScreen.dart';
// import 'package:reportes/screen/displayPicScreen.dart';

import 'package:reportes/screen/takePicScreen.dart';

class HomeScreen extends StatefulWidget {

final String mensaje;
     
  static Route<dynamic> route(String mensaje) {
    return MaterialPageRoute(
      builder: (context) => HomeScreen(mensaje: mensaje),
    );
  }
  
  const HomeScreen({Key key, @required this.mensaje}) : super(key: key);
   @override
  _HomeScreenState createState() => new _HomeScreenState(mensaje: mensaje);
}

Future<void> cargarSesion() async {
   String session = await storage.read(key: 'user');
      if(session?.isEmpty == false){
        HomeScreen.route(session);
      }
}

class _HomeScreenState extends State<HomeScreen> {
// Declare a field that holds the Todo.
  final String mensaje;
 
  // In the constructor, require a Todo.
  _HomeScreenState({Key key, @required this.mensaje});

  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generar Reporte'),
        actions: <Widget>[
    IconButton(
      icon: Icon(Icons.close),
      tooltip: 'Salir',
      onPressed: (){
        storage.delete(key: 'user');
        storage.delete(key: 'pass');
        print("cerrando sesion dirigiendo a login");
        Navigator.of(context).pushReplacement(LoginScreen.route());
      },
    ),
        ],
      ),
      body:
      StreamBuilder(
        stream: bloc.getNavigation,
        initialData: bloc.navigationProvider.currentNavigation,
        builder: (context, snapshot) {
          if (bloc.navigationProvider.currentNavigation == "Home") {
            return CreateReport();
          }
          if (bloc.navigationProvider.currentNavigation == "PageOne") {

            return TakePicture(camera: null,);
          }
          // if (bloc.navigationProvider.currentNavigation == "PageTwo") {
          //   return PageTwo();
          // }
        }
      ),
    );
  }

}

// Future<Widget> main() async {
//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();

//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;
//   return firstCamera;

  
// }




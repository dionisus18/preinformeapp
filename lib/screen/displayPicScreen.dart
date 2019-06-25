import 'dart:io';

import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
      floatingActionButton: 
      Stack(
  children: <Widget>[
    Align(
      alignment: Alignment.bottomLeft,
      child: FloatingActionButton(
        child: Icon(Icons.close),
        heroTag: null,
        onPressed:() async { 
      //     String session = await storage.read(key: 'user');
      // if(session?.isEmpty == false){
      //   print("redirigiendo");
      //   Navigator.of(context).pop(HomeScreen.route(session));
        // HomeScreen.route(session);
      // }
        }
      ),
    ),
    Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        child: Icon(Icons.done),
        heroTag: null,
        // Provide an onPressed callback.
        onPressed: () {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          
            // If an error occurs, log the error to the console.
            // Navigator.of(context).pushReplacement(HomeScreen.route("session"));
            // _globalState.setState((){ _globalState._imgRoute = this.imagePath; });
            print("oshe si"+this.imagePath);
            // Navigator.of(context).pop(HomeScreen.route(session));
          }
      ),
    ),
  ],
)
    );
  }
}
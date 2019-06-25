import 'package:reportes/app/app.dart';
import 'package:flutter/material.dart';
//Punto de entrada para su aplicación
void main() => runApp(AppBasica());
// import 'dart:async';
// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart' show join;
// import 'package:path_provider/path_provider.dart';

// Future<void> main() async {

//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();

//   // Get a specific camera from the list of available cameras
//   final firstCamera = cameras.first;

//   runApp(
//     MaterialApp(
//       theme: ThemeData.dark(),
//       // home: TakePictureScreen(
//       //   // Pass the appropriate camera to the TakePictureScreen Widget
//       //   camera: firstCamera,
//       // ),
//       home: MyApp(),
//     ),
//   );
// }

// // A screen that allows users to take a picture using a given camera
// class TakePictureScreen extends StatefulWidget {
//   final CameraDescription camera;

//   const TakePictureScreen({
//     Key key,
//     @required this.camera,
//   }) : super(key: key);

//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }

// class TakePictureScreenState extends State<TakePictureScreen> {
//   CameraController _controller;
//   Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     // In order to display the current output from the Camera, you need to
//     // create a CameraController.
//     _controller = CameraController(
//       // Get a specific camera from the list of available cameras
//       widget.camera,
//       // Define the resolution to use
//       ResolutionPreset.medium,
//     );

//     // Next, you need to initialize the controller. This returns a Future
//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     // Make sure to dispose of the controller when the Widget is disposed
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Take a picture')),
//       // You must wait until the controller is initialized before displaying the
//       // camera preview. Use a FutureBuilder to display a loading spinner until
//       // the controller has finished initializing
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the Future is complete, display the preview
//             return CameraPreview(_controller);
//           } else {
//             // Otherwise, display a loading indicator
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.camera_alt),
//         // Provide an onPressed callback
//         onPressed: () async {
//           // Take the Picture in a try / catch block. If anything goes wrong,
//           // catch the error.
//           try {
//             // Ensure the camera is initialized
//             await _initializeControllerFuture;

//             // Construct the path where the image should be saved using the path
//             // package.
//             final path = join(
//               // In this example, store the picture in the temp directory. Find
//               // the temp directory using the `path_provider` plugin.
//               (await getTemporaryDirectory()).path,
//               '${DateTime.now()}.png',
//             );

//             // Attempt to take a picture and log where it's been saved
//             await _controller.takePicture(path);

//             // If the picture was taken, display it on a new screen
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DisplayPictureScreen(imagePath: path),
//               ),
//             );
//           } catch (e) {
//             // If an error occurs, log the error to the console.
//             print(e);
//           }
//         },
//       ),
//     );
//   }
// }

// // A Widget that displays the picture taken by the user
// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;

//   const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Display the Picture')),
//       // The image is stored as a file on the device. Use the `Image.file`
//       // constructor with the given path to display the image
//       body: Image.file(File(imagePath)),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Inicio de Sesión',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Inicio de Sesión'),
//         ),
//         body: Center(
//           child: MyForm()
//       ),
//       ),
//     );
//   }
// }

// class MyForm extends StatelessWidget {
//  final _formKey = GlobalKey<FormState>();

// @override
// Widget build(BuildContext context) {
//   return Form(
//     key: _formKey,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         TextFormField(
//           validator: (value) {
//             if (value.isEmpty) {
//               return 'Please enter some text';
//             }
//           },
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16.0),
//           child: RaisedButton(
//             onPressed: () {
//               // Validate will return true if the form is valid, or false if
//               // the form is invalid.
//               if (_formKey.currentState.validate()) {
//                 // Process data.
//               }
//             },
//             child: Text('Submit'),
//           ),
//         ),
//       ],
//     ),
//   );
// }
// }



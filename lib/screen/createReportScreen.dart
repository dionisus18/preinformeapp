import 'package:flutter/material.dart';
import 'package:reportes/bloc/navigation_bloc.dart';

enum SingingCharacter { no,dia, irregular, sin, sinpauta }
enum AnotherCharacter { no,limpio, sucio, sinnove, suelto, falta, sinanc }



class CreateReport extends StatefulWidget {
  @override
  _CreateReportState createState() => _CreateReportState();
}

class _CreateReportState extends State<CreateReport> {

  String _imgRoute = 'assets/empty.jpg';
  SingingCharacter _character = SingingCharacter.no;
  AnotherCharacter _character2 = AnotherCharacter.no;
   var listaMantenimiento = ["Seleccione","Mantenimiento al dia", "Mantenimiento irregular","Sin Mantenimiento","Sin Pauta de Mantenimiento" ];
  var listaObservacionVisual = ["Seleccione","Limpio", "Sucio","Sin Novedad" ,"Suelto","Falta Fijacion", "Sin Anclaje" ];
 

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "this.mensaje",
                style: TextStyle(
                  fontSize: 32.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            
          ),
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Formulario de ingreso",
                style: TextStyle(
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,

              ),
            ],
            
          ),
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Fotos de equipo",
                style: TextStyle(
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: <Widget>[
              new Expanded(
                child: Container(
                  // color: Colors.blue,
                  height: 200,
                    child:GridView.count(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(5.0),
                    crossAxisSpacing: 10.0,
                    crossAxisCount: 2,
                    children: makeImagesContainers()
                  ),
                ),
              ),
            ],
          ),
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Condicion de mantenimiento",
                style: TextStyle(
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: Container(
                  // color: Colors.blue,
                    child:makeRadioTiles(),
                  ),
                ),
              ],
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Observación visual",
                style: TextStyle(
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: Container(
                  // color: Colors.blue,
                    child:makeRadioTiles2(),
                    
                  ),
                ),
              ],
            )
          ),
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Acciones realizadas",
                style: TextStyle(
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          ),
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: Container(
                  // color: Colors.blue,
                    child:makeRadioTiles2(),
                    
                  ),
                ),
              ],
            )
          ),
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Observaciones",
                style: TextStyle(
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
      );
  }

List<Widget> makeImagesContainers(){
  List<Widget> list = new List<Widget>();
  for(var i = 0; i < 4; i++){
  list.add(new InkWell(
      child: 
        DecoratedBox(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_imgRoute),
                                // ...
            ),
          ),
         ),
        onTap: () {
          // final cameras = await availableCameras();
          // final firstCamera = cameras.first;
           Navigator.of(context).pop();
                bloc.updateNavigation("PageOne");
          // Navigator.of(context).push(TakePictureScreen.route(firstCamera));
          print("presionado imagen");
      },
    ),
  );
  }
  return list;
} 

Widget makeRadioTiles() {
  List<Widget> list = new List<Widget>();
    for(var i = 0; i < listaMantenimiento.length; i++){
      list.add(new RadioListTile<SingingCharacter>(
                    title: Text(listaMantenimiento[i]),
                    value: SingingCharacter.values[i],
                    groupValue: _character,
                    onChanged: (SingingCharacter value) { setState(() { _character = value; });},
              ),
      );
   }

   Column column = new Column(children: list,);
   return column;
}

Widget makeRadioTiles2() {
  // print(listado);
  List<Widget> list = new List<Widget>();
    for(var i = 0; i < listaObservacionVisual.length; i++){
      list.add(new RadioListTile<AnotherCharacter>(
                    title: Text(listaObservacionVisual[i]),
                    value: AnotherCharacter.values[i],
                    groupValue: _character2,
                    onChanged: (AnotherCharacter value) { setState(() { _character2 = value; });},
              ),
      );
   }

   Column column = new Column(children: list,);
   return column;
}
}

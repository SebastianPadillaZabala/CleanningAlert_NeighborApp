import 'package:cleanning_alert_neighbor/tabPages/mapa_ruta.dart';
import 'package:flutter/material.dart';

class UbicacionTabPage extends StatefulWidget {
  UbicacionTabPage({Key? key}) : super(key: key);

  @override
  State<UbicacionTabPage> createState() => _UbicacionTabPageState();
}

class _UbicacionTabPageState extends State<UbicacionTabPage> {
  @override
  Widget build(BuildContext context) {
    final Zonas = ['Zona Sur', 'Zona Este', 'Zona Oeste', 'Zona Norte'];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const TextField(
            decoration: InputDecoration(
                labelText: 'Search', suffixIcon: Icon(Icons.search)),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return IconButton(
                icon: Icon(Icons.add_circle_outline_sharp),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => MapaRutaTabPage()));
                },
              );

              //ListTile(
              //title: Text(Zonas[index]),
              //);
            },
          )),
        ],
      ),
    );
    /*child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Buscar por Zona",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 103, 103, 103)),
                    icon: Icon(Icons.search,
                        color: Color.fromARGB(255, 103, 103, 103))),
              ),
            ),
              
          ],
        ),*/
  }
}

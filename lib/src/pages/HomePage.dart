import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:parcial_1/src/model/Asignatura.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final text = TextEditingController();
  Asignatura asignatura = new Asignatura(codigo: null, nombre: null);

List<Asignatura> asignaturas = [];
  @override
  void initState() {
    text.text = '4';
    super.initState();
    final res = GetStorage().read("asignaturas")??null;
    if(res != null){
      final a = jsonDecode(res);
      asignaturas = (a as List).map((asignatura)=>Asignatura.fromJson(asignatura)).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    
    String nota;
    final _formKey = GlobalKey<FormState>();
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          bottomNavigationBar: TabBar(tabs: [
            Icon(Icons.power_input),
            Icon(Icons.people),
            Icon(Icons.access_time),
            Icon(Icons.access_time),
          ]),
          body: TabBarView(children: [
            Container(
              child: ListView.builder(
                  itemCount: asignaturas.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(asignaturas[i].nombre),
                    );
                  }),
            ),
            Container(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: text,
                        decoration: InputDecoration(labelText: 'Codigo'),
                        onChanged: (value) {
                          setState(() {
                            asignatura.codigo = value;
                          });
                        },
                        validator: (value) {
                          //int number = int.parse(value);
                          if (value.isEmpty) {
                            return 'Por favor ingresa un valor';
                          }
                          // if (number < 0 || number > 5) {
                          //   return 'Debe ingresar un valor entre 0 y 5';
                          // }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nombre'),
                        onChanged: (value) {
                          setState(() {
                            asignatura.nombre = value;
                          });
                        },
                        validator: (value) {
                          //int number = int.parse(value);
                          if (value.isEmpty) {
                            return 'Por favor ingresa un valor';
                          }
                          // if (number < 0 || number > 5) {
                          //   return 'Debe ingresar un valor entre 0 y 5';
                          // }
                          return null;
                        },
                      ),
                      RaisedButton(
                          child: Text('Guardar'),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                
                              });
                              asignaturas.add(asignatura);
                              GetStorage().write("asignaturas", jsonEncode(asignaturas.map((asignatura)=>asignatura.toJson()).toList()));
                            }
                          })
                    ],
                  )),
            ),
            Container(
              child: Center(
                child: Text('Segundo tab'),
              ),
            ),
          ]),
        ));
  }
}
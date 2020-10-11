import 'package:flutter/cupertino.dart';

class Asignatura {
  int id;
  String codigo;
  String nombre;  

  Asignatura({
    this.id,
    @required this.codigo,
    @required this.nombre
  });

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map={
      'id' : this.id,
      'codigo': this.codigo,
      'nombre': this.nombre
    };
    return map;
  }

  factory Asignatura.fromJson(Map<String, dynamic> json){
    return Asignatura(id: json['id'],codigo: json['codigo'], nombre: 'nombre');
  }

}
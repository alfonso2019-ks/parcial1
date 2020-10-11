import 'package:flutter/cupertino.dart';

class Item {
  String nombre;
  int porcentaje;
  double nota;

  Item({
    @required this.nombre,
    this.porcentaje,
    nota
  });

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map={
      'nombre' : this.nombre,
      'porcentaje': this.porcentaje,
      'nota': this.nota
    };
    return map;
  }

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(nombre: json['nombre'],porcentaje: json['porcentaje'], nota: 'nota');
  }

}
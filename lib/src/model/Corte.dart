import 'dart:convert';

import 'package:parcial_1/src/model/Item.dart';

class Corte {
  List<Item> items= [Item(nombre: "Quiz"),Item(nombre: "Trabajo de talleres"),Item(nombre: "Parcial práctico"),Item(nombre: "Parcial Teórico")];

  Corte({items});
  double calcularDefinitiva(){
    double definitiva=0;
    this.items.forEach((item){
      definitiva += item.nota*(item.porcentaje/100);
    }); 
    return definitiva;
  }

  factory Corte.fromJson(Map<String, dynamic> json){
    return Corte(items: (json['items'] as List).map((item)=>Item.fromJson(item)).toList());
  }
}
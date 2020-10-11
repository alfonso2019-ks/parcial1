import 'dart:convert';

import 'package:parcial_1/src/model/Corte.dart';

class Nota {
  int id;
  String asignatura;
  List<Corte> cortes= [Corte(), Corte(), Corte()];
  String alumno;

  Nota({this.id,this.asignatura, this.cortes, this.alumno});

  double calcularDefinitiva(){
    double definitiva = 0;
    this.cortes.forEach((corte){
      definitiva += corte.calcularDefinitiva(); 
    });
    return definitiva;
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map={
      'id' : this.id,
      'asignatura': this.asignatura,
      'cortes': this.cortes,
      'alumno': this.alumno
    };
    return map;
  }

  factory Nota.fromJson(Map<String, dynamic> json){
    return Nota(id: json['id'],asignatura: json['asignatura'], alumno: json['alumno'] ,cortes: (json['cortes'] as List).map((corte)=>Corte.fromJson(corte)).toList());
  }
}
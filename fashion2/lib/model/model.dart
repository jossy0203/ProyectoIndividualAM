import 'package:fashion2/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Producto {
  String nombre;
  String descripcion;
  double precio;
  String imagen;

  Producto({required this.nombre, required this.descripcion, required this.precio, required this.imagen});
}





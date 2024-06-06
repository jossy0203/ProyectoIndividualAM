import 'package:fashion2/pages/model.dart';
import 'package:flutter/material.dart';

class CarritoScreen extends StatefulWidget {
  const CarritoScreen({super.key});

  @override
  State<CarritoScreen> createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {
  final List<Producto> productos = [
    Producto(nombre: 'Producto 1', descripcion: 'Descripción del producto 1', precio: 10, imagen: 'images/imagen1.jpg'),
    Producto(nombre: 'Producto 2', descripcion: 'Descripción del producto 2', precio: 20, imagen: 'images/imagen2.jpg'),
    Producto(nombre: 'Producto 2', descripcion: 'Descripción del producto 2', precio: 20, imagen: 'images/imagen2.jpg'),
    Producto(nombre: 'Producto 2', descripcion: 'Descripción del producto 2', precio: 20, imagen: 'images/imagen2.jpg'),
    // Agrega más productos según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];
          return ListTile(
            leading: Image.asset(
              producto.imagen,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(producto.nombre),
            subtitle: Text('Precio: \$${producto.precio.toString()}'),
            trailing: Text('Cantidad: 1'), // Puedes agregar la cantidad dinámicamente si lo deseas
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${_calcularTotal().toStringAsFixed(2)}', // Calcula y muestra el total de la compra
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Agrega la lógica para realizar el pago
                },
                child: Text('Pagar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _calcularTotal() {
    double total = 0;
    for (var producto in productos) {
      total += producto.precio;
    }
    return total;
  }
}
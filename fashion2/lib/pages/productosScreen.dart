import 'package:flutter/material.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  final List<Map<String, String>> products = [
    {
      'image': 'images/imagen1.jpg',
      'title': 'Camiseta Blanca',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    {
      'image': 'images/imagen2.jpg',
      'title': 'Pantalón Negro',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    {
      'image': 'images/imagen3.jpg',
      'title': 'Vestido Rojo',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    {
      'image': 'images/imagen1.jpg',
      'title': 'Vestido Rojo',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    {
      'image': 'images/imagen2.jpg',
      'title': 'Vestido Rojo',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    {
      'image': 'images/imagen3.jpg',
      'title': 'Vestido Rojo',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    // Agrega más productos según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Ropa'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    products[index]['image']!,
                    height: 100.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(children: [
                      Text(
                        products[index]['title']!,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        products[index]['descripcion']!,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ]
                  )
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Colors.black),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Perfil',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/productos');
              break;
            case 2:
              Navigator.pushNamed(context, '/carrito');
              break;
            case 3:
              Navigator.pushNamed(context, '/perfil');
              break;
          }
        },
      ),
    );
  }
}

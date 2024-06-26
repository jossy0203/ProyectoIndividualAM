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
      'title': 'Blusa Gris',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    {
      'image': 'images/imagen2.jpg',
      'title': 'Jean Verde',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    {
      'image': 'images/imagen3.jpg',
      'title': 'Chaqueta Negra',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    {
      'image': 'images/imagen4.jpg',
      'title': 'Zapatos Blancos',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    {
      'image': 'images/imagen5.jpg',
      'title': 'Sueter Café',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    {
      'image': 'images/imagen6.jpg',
      'title': 'Collar',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    {
      'image': 'images/imagen7.jpg',
      'title': 'Aretes',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    {
      'image': 'images/imagen8.jpg',
      'title': 'Gorra',
      'descripcion':
          'La camisa blanca es una prenda de vestir de manga larga o corta, con un cuello y una abertura frontal que generalmente se cierra con botones.'
    },
    
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
                    height: 230.0,
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
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.black),
            label: 'list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits, color: Colors.black),
            label: 'list',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
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
            case 4:
              Navigator.pushNamed(context, '/list');
              break;
            case 5:
              Navigator.pushNamed(context, '/promotion');
              break;
          }
        },
      ),
    );
  }
}

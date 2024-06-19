import 'package:fashion2/model/product.model.dart';
import 'package:fashion2/pages/firebase.service.dart';
import 'package:fashion2/pages/home.dart';
import 'package:flutter/material.dart';

class ClothesListPage extends StatefulWidget {
  @override
  _ClothesListPageState createState() => _ClothesListPageState();
}

class _ClothesListPageState extends State<ClothesListPage> {
  late Future<List<Clothes>> _clothesList;  // Asegúrate de que _clothesList sea de tipo Future<List<Clothes>>

  @override
  void initState() {
    super.initState();
    _clothesList = getClothes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Ropa'),
      ),
      body: FutureBuilder<List<Clothes>>(
        future: _clothesList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay datos disponibles'));
          } else {
            return GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: snapshot.data!.map((clothes) {
                return ProductCard(
                  label: clothes.name,
                  price: clothes.price, 
                  imageUrl: '', 
                );
              }).toList(),
            );
          }
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

import 'package:fashion2/pages/carritoScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fashion & Flair'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CarritoScreen()),
                      );
                    },
                  ),
                  if (cart.items.length > 0)
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          cart.items.length.toString(),
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                ],
              );
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(36.0),
        children: [
          // Popular Categories
          SizedBox(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                      child: CategoryIcon(
                          icon: Icons.local_activity, label: 'Blusas')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                      child: CategoryIcon(
                          icon: Icons.devices, label: 'Pantalones')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                      child:
                          CategoryIcon(icon: Icons.chair, label: 'Chaquetas')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                      child: CategoryIcon(icon: Icons.casino, label: 'Suéter')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                      child: CategoryIcon(icon: Icons.pets, label: 'Jeans')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                      child:
                          CategoryIcon(icon: Icons.cable, label: 'Accesorios')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                      child: CategoryIcon(
                          icon: Icons.ice_skating_outlined, label: 'Zapatos')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                      child:
                          CategoryIcon(icon: Icons.more_horiz, label: 'More')),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // imagen1 of the Week
          CarouselSlider(
            options: CarouselOptions(
              height: 250,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: [
              Card(
                elevation: 5,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset('images/portada.jpg',
                          fit: BoxFit.cover, width: 500.0),
                    ),
                    ListTile(
                      title: Text('Viste tu imaginación',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle:
                          Text('Donde la moda se encuentra con la creatividad'),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset('images/portada1.jpg',
                          fit: BoxFit.cover, width: 500.0),
                    ),
                    ListTile(
                      title: Text('Estilo que habla por sí mismo',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Encuentra tu voz en nuestra tienda'),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset('images/portada2.jpg',
                          fit: BoxFit.cover, width: 500.0),
                    ),
                    ListTile(
                      title: Text('Eleva tu estilo',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Moda que inspira, ropa que enamora'),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset('images/portada3.jpg',
                          fit: BoxFit.cover, width: 500.0),
                    ),
                    ListTile(
                      title: Text(
                        'De la pasarela a tu armario',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle:
                          Text('Cdescubre las tendencias en nuestra tienda'),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset('images/portada4.jpg',
                          fit: BoxFit.cover, width: 500.0),
                    ),
                    ListTile(
                      title: Text('Donde cada prenda cuenta una historia',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('encuentra la tuya aquí'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Popular Products
          Text('Populares', style: Theme.of(context).textTheme.headlineSmall),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ProductCard(
                  imageUrl: 'images/imagen1.jpg',
                  label: 'Blusa Gris',
                  price: '\$50'),
              ProductCard(
                  imageUrl: 'images/imagen2.jpg',
                  label: 'Pantalon Jean Verde',
                  price: '\$70'),
              ProductCard(
                  imageUrl: 'images/imagen3.jpg',
                  label: 'Chaqueta Negra',
                  price: '\$30'),
              ProductCard(
                  imageUrl: 'images/imagen4.jpg',
                  label: 'Zapatos Blancos',
                  price: '\$40'),
              ProductCard(
                  imageUrl: 'images/imagen5.jpg',
                  label: 'Sueter de lana café',
                  price: '\$40'),
              ProductCard(
                  imageUrl: 'images/imagen6.jpg',
                  label: 'Collar',
                  price: '\$40'),
              ProductCard(
                  imageUrl: 'images/imagen7.jpg',
                  label: 'Arretes',
                  price: '\$40'),
              ProductCard(
                  imageUrl: 'images/imagen8.jpg',
                  label: 'Gorra',
                  price: '\$40'),
            ],
          ),
        ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
              Navigator.pushNamed(context, "/form");
          },
          child: Icon(Icons.add),
          ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(icon, size: 30),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String label;
  final String price;

  ProductCard(
      {required this.imageUrl, required this.label, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(imageUrl, fit: BoxFit.cover),
          ),
          ListTile(
            title: Text(label),
            subtitle: Text(price),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false)
                    .addItem(label, price);
              },
              child: Text('Agregar al Carrito'),
            ),
          ),
        ],
      ),
    );
  }
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(String label, String price) {
    _items.add(CartItem(label: label, price: price));
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void editItem(int index, String newLabel, String newPrice) {
    _items[index] = CartItem(label: newLabel, price: newPrice);
    notifyListeners();
  }
}

class CartItem {
  String label;
  String price;

  CartItem({required this.label, required this.price});
}

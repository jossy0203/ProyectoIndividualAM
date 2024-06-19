import 'package:flutter/material.dart';

class PromotionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promociones'),
        // Personaliza la barra de navegación según tus necesidades
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Cabecera con título y imagen de promoción
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '¡Descuentos Especiales!',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Image.asset(
                    'images/imagen1.jpg', // Aquí colocarías la ruta de tu imagen de promoción
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '¡Hasta un 50% de descuento en una selección de prendas de verano! ¡No te pierdas esta oportunidad!',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      // Acción cuando se presiona el botón
                      // Navegar a la sección de ofertas
                    },
                    child: Text('Explorar Ofertas'),
                  ),
                ],
              ),
            ),

            // Sección de ofertas destacadas (ejemplo con una lista estática)
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Ofertas Destacadas',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  // Ejemplo de lista de productos en promoción (puedes usar un ListView.builder para listas dinámicas)
                  _buildPromotionProduct(
                    'Camiseta de Verano',
                    'images/imagen2.jpg', // Ruta de la imagen del producto
                    '\$25.00',
                    '\$15.00', // Precio con descuento
                  ),
                  _buildPromotionProduct(
                    'Pantalón Casual',
                    'images/imagen3.jpg',
                    '\$45.00',
                    '\$30.00',
                  ),
                  _buildPromotionProduct(
                    'Vestido Elegante',
                    'images/imagen4.jpg',
                    '\$55.00',
                    '\$40.00',
                  ),
                ],
              ),
            ),
          ],
        ),
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

  Widget _buildPromotionProduct(String name, String imagePath, String originalPrice, String discountedPrice) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 80.0,
        height: 80.0,
        fit: BoxFit.cover,
      ),
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Precio original: $originalPrice'),
          Text(
            'Precio con descuento: $discountedPrice',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      trailing: ElevatedButton(
        onPressed: () {
          // Acción cuando se presiona el botón (ver producto)
        },
        child: Text('Ver Producto'),
      ),
    );
  }
}

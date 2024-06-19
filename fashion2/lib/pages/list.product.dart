import 'package:fashion2/pages/firebase.service.dart';
import 'package:flutter/material.dart';

class ClothesListPage extends StatefulWidget {
  @override
  _ClothesListPageState createState() => _ClothesListPageState();
}

class _ClothesListPageState extends State<ClothesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Ropa'),
      ),
      body: FutureBuilder(
          future: getClothes(),
          builder: (context, snapshot) {
            return GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            'images/imagen1.jpg',
                            height: 230.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(children: [
                              Text(
                                snapshot.data?[index]['name'],
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                snapshot.data?[index]['description']!,
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(height:30),
                              Row(
                                children: [
                                  Text(
                                    'Precio:',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    snapshot.data?[index]['price']!,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                              Row(children: [
                                Text(
                                  'Talla:',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  snapshot.data?[index]['talla']!,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ]),
                              SizedBox(height:30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () async{
                                      await Navigator.pushNamed(context, "/edit", arguments: {
                                        "name": snapshot.data?[index]['name'],
                                        "uid": snapshot.data?[index]['uid'],
                                         "description": snapshot.data?[index]['description'],
                                          "price": snapshot.data?[index]['price'],
                                           "talla": snapshot.data?[index]['talla'],
                                      });
                                      setState(() {
                                      });
                                    },
                                  ),
                                  SizedBox(width: 40),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                     },
                                   ),
                                ],
                              )
                            ])),
                      ],
                    ),
                  );
                });
          }),
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

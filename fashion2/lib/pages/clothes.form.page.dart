import 'package:fashion2/pages/firebase.service.dart';
import 'package:flutter/material.dart';

class ClothesFormPage extends StatefulWidget {
  @override
  _ClothesFormPageState createState() => _ClothesFormPageState();
}

class _ClothesFormPageState extends State<ClothesFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _tallaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Prenda'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircleAvatar(
                  radius: 100.0,
                  backgroundColor: const Color.fromARGB(255, 208, 208, 208),
                  backgroundImage: AssetImage("images/logo1.png"),
                ),
                SizedBox(height: 30),
                Container(
                  width: 450,
                  child: TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    enableInteractiveSelection: false,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Ingrese el nombre de la prenda",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 254, 254)),
                        labelText: "Nombre",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(159, 132, 69, 226),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255)))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese el nombre';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  width: 450,
                  child: TextFormField(
                    controller: _descriptionController,
                    enableInteractiveSelection: false,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Ingrese una descripcion",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 254, 254)),
                        labelText: "Descripcion",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(159, 132, 69, 226),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255)))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese la descripción';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  width: 450,
                  child: TextFormField(
                    controller: _priceController,
                    enableInteractiveSelection: false,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Ingrese el precio",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 254, 254)),
                        labelText: "Precio",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(159, 132, 69, 226),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255)))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese el precio';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  width: 450,
                  child: TextFormField(
                    controller: _tallaController,
                    enableInteractiveSelection: false,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Ingrese la talla",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 254, 254)),
                        labelText: "Talla",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(159, 132, 69, 226),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255)))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese la talla';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? true){
                    await addClothes(
                        _nameController.text,
                        _descriptionController.text,
                        _priceController.text,
                        _tallaController.text);
                    };
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, "/list");
                  },
                  child: Text('Subir'),
                ),
              ])
            ],
          ),
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
}

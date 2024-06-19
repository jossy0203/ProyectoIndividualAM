import 'package:fashion2/pages/firebase.service.dart';
import 'package:flutter/material.dart';

class EditClothes extends StatefulWidget {
  const EditClothes({super.key});

  @override
  State<EditClothes> createState() => _EditClothesState();
}

class _EditClothesState extends State<EditClothes> {
  TextEditingController _nameController = TextEditingController(text: "");
  TextEditingController _descriptionController =
      TextEditingController(text: "");
  TextEditingController _priceController = TextEditingController(text: "");
  TextEditingController _tallaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    _nameController.text = arguments['name'];

    return Scaffold(
      appBar: AppBar(
          title: Text('Editar Producto'),
          backgroundColor: Color.fromARGB(159, 178, 173, 229)),
      backgroundColor: const Color.fromARGB(255, 253, 253, 218),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 60),
            Container(
                child: Column(
                  children: [
              TextField(
                controller: _nameController,
                enableInteractiveSelection: false,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Modificacion Nombre",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    labelText: "Nombre",
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(159, 132, 69, 226),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 249, 249, 249)))),
              ),
              TextField(
                controller: _descriptionController,
                enableInteractiveSelection: false,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Modificacion Descripcion",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    labelText: "Descripcion",
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(159, 132, 69, 226),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 249, 249, 249)))),
              ),
              TextField(
                controller: _priceController,
                enableInteractiveSelection: false,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Modificacion Precio",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    labelText: "Precio",
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(159, 132, 69, 226),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 249, 249, 249)))),
              ),
              TextField(
                controller: _tallaController,
                enableInteractiveSelection: false,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Modificacion Talla",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    labelText: "Talla",
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(159, 132, 69, 226),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 249, 249, 249)))),
              ),
            ])),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () async {
                  await updateClothes(
                          arguments['uid'],
                          _nameController.text,
                          _descriptionController.text,
                          _priceController.text,
                          _tallaController.text)
                      .then((value) {
                    Navigator.pop(context);
                  });
                },
                child: const Text('Actualizar')),
          ],
        ),
      ),
    );
  }
}

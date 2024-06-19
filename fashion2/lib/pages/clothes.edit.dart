import 'package:fashion2/pages/firebase.service.dart';
import 'package:flutter/material.dart';

class EditClothes extends StatefulWidget {
  const EditClothes({super.key});

  @override
  State<EditClothes> createState() => _EditClothesState();
}

class _EditClothesState extends State<EditClothes> {
 TextEditingController _nameController = TextEditingController(text: "");
 TextEditingController _descriptionController = TextEditingController(text: "");
 TextEditingController _priceController = TextEditingController(text: "");
 TextEditingController _tallaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    _nameController.text = arguments['name'];

    return Scaffold(
      appBar: AppBar(
         title: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
        child: Image.asset(
          'images/wegotk.png',
           height: 50,
        ),
        ),
        ),
         backgroundColor: const Color(0xFF14A34D), 
      ),
      backgroundColor: const Color.fromARGB(255, 253, 253, 218),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Ingrese la modificación'
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                hintText: 'Ingrese la modificación'
              ),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                hintText: 'Ingrese la modificación'
              ),
            ),
            TextField(
              controller: _tallaController,
              decoration: const InputDecoration(
                hintText: 'Ingrese la modificación'
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await updateClothes(arguments['uid'], _nameController.text, _descriptionController.text, _priceController.text, _tallaController.text ).then((value){
                  Navigator.pop(context);
                });
              },
              child: const Text('Actualizar')
              ),
          ],
        ),
      ),
    );
  }
}
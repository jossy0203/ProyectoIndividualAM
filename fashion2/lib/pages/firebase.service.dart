import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getClothes() async {
  List people = [];
  CollectionReference collectionReferencePeople = db.collection("products");
  QuerySnapshot queryPeople = await collectionReferencePeople.get();
  queryPeople.docs.forEach((documento) {
    people.add(documento.data());
  });
  return people;
}

Future<void> addClothes(String name, String description, String price, String talla) async {
  await db.collection("products").add({
    "name": name,
    "description": description,
    "price": price,
    "talla": talla,
    "timestamp": FieldValue.serverTimestamp(),
  });
}

Future<void> addUser(String name, String lastname, String email, String password, String confirmation) async {
  await db.collection("register").add({
    "name": name,
    "lastname": lastname,
    "email": email,
    "password": password,
    "confirmation": confirmation,
    "timestamp": FieldValue.serverTimestamp(),
  });
}

Future<void> updateClothes(String uid, String newName, String newDescription, String newPrice, String newTalla ) async {
  await db.collection("products").doc(uid).set({
    "name": newName,
    "description": newDescription,
    "price": newPrice,
    "talla": newTalla,
    });
}
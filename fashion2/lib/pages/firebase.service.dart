import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion2/model/product.model.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Clothes>> getClothes() async {
  List<Clothes> clothesList = [];
  QuerySnapshot querySnapshot = await db.collection('clothes').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final clothes = Clothes(
      name: data['name'],
      description: data['description'],
      price: data['price'],
      talla: data['talla']
    );
    clothesList.add(clothes);
  }
  return clothesList;
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
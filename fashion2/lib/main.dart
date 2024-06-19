import 'package:fashion2/firebase_options.dart';
import 'package:fashion2/pages/carritoScreen.dart';
import 'package:fashion2/pages/clothes.edit.dart';
import 'package:fashion2/pages/clothes.form.page.dart';
import 'package:fashion2/pages/home.dart';
import 'package:fashion2/pages/list.product.dart';
import 'package:fashion2/pages/loginScreen.dart';
import 'package:fashion2/pages/mainscreen.dart';
import 'package:fashion2/pages/perfilScreen.dart';
import 'package:fashion2/pages/productosScreen.dart';
import 'package:fashion2/pages/promotion.dart';
import 'package:fashion2/pages/registroScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda de Ropa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        secondaryHeaderColor: Colors.black,
      ),
      home: MainScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/registro': (context) => RegistroScreen(),
        '/productos': (context) => ProductosScreen(),
        '/carrito': (context) => CarritoScreen(),
        '/perfil': (context) => PerfilScreen(),
        '/home': (context) => HomeScreen(),
        '/list': (context) => ClothesListPage(),
        '/form': (context) => ClothesFormPage(),
        '/promotion': (context) => PromotionsScreen(),
        '/edit': (context) => EditClothes()
      },
    );
  }
}
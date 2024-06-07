import 'package:fashion2/pages/carritoScreen.dart';
import 'package:fashion2/pages/home.dart';
import 'package:fashion2/pages/loginScreen.dart';
import 'package:fashion2/pages/mainscreen.dart';
import 'package:fashion2/pages/perfilScreen.dart';
import 'package:fashion2/pages/productosScreen.dart';
import 'package:fashion2/pages/registroScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
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
      },
    );
  }
}
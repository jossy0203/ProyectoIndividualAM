import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginform = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Registro de Usuario'),
          backgroundColor: Color.fromARGB(159, 178, 173, 229)),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _loginform,
          child: ListView(
            children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircleAvatar(
                  radius: 100.0,
                  backgroundColor: const Color.fromARGB(255, 208, 208, 208),
                  backgroundImage: AssetImage("images/logo1.png"),
                ),
                SizedBox(height: 30),
                Text(
                  "Registrate",
                  style: TextStyle(
                      fontFamily: "Merriweather",
                      fontSize: 30.0,
                      color: Colors.white),
                ),
                SizedBox(height: 50),
                SizedBox(height: 30),
                Container(
                  width: 400,
                  child: TextFormField(
                    controller: _userController,
                    keyboardType: TextInputType.text,
                    enableInteractiveSelection: false,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Ingrese su correo electronico",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        labelText: "Correo electronico",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(159, 132, 69, 226),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 249, 249, 249)))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su correo electrónico';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Por favor ingrese un correo electrónico válido';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 400,
                  child: TextFormField(
                    controller: _passwordController,
                    enableInteractiveSelection: false,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Ingrese se contraseña",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        labelText: "Contraseña",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(159, 132, 69, 226),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 249, 249, 249)))),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su contraseña';
                      }
                      if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 40),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_loginform.currentState?.validate() ?? true) {
                        Navigator.pushNamed(context, "/home");
                      }
                    },
                    child: Text('Ingresar'),
                  ),
                ])
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

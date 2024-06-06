import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formValidate = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // void _submitForm() {
  //   if (_formValidate.currentState?.validate() ?? false) {
  //     // Procesar los datos del formulario
  //     print('Nombre: ${_nameController.text}');
  //     print('Correo Electrónico: ${_emailController.text}');
  //     print('Contraseña: ${_passwordController.text}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
        backgroundColor: Color.fromARGB(159, 178, 173, 229)
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo.jpg'), 
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formValidate,
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                CircleAvatar(
                  radius: 100.0,
                  backgroundColor: const Color.fromARGB(255, 208, 208, 208),
                  backgroundImage: AssetImage("images/logo1.png"),
                ),
                SizedBox(height: 30),
                Text(
                  "Registrate",
                  style: TextStyle(fontFamily: "Merriweather", fontSize: 30.0, color: Colors.white),
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  enableInteractiveSelection: false,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Ingrese su nombre",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      labelText: "Nombre",
                      labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      prefixIcon: Icon(Icons.person, color: Color.fromARGB(159, 132, 69, 226),),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 249, 249, 249)))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su nombre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  enableInteractiveSelection: false,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Ingrese su correo electronico",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      labelText: "Correo electronico",
                      labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      prefixIcon: Icon(Icons.person, color: Color.fromARGB(159, 132, 69, 226),),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 249, 249, 249)))),
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
                SizedBox(height: 30),
                TextFormField(
                  controller: _passwordController,
                  enableInteractiveSelection: false,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Ingrese se contraseña",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      labelText: "Contraseña",
                      labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      prefixIcon: Icon(Icons.person, color: Color.fromARGB(159, 132, 69, 226),),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 249, 249, 249)))),
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
                SizedBox(height: 30),
                TextFormField(
                  controller: _confirmPasswordController,
                  enableInteractiveSelection: false,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Confirme su contraseña",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      labelText: "Confirmacion",
                      labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      prefixIcon: Icon(Icons.person, color: Color.fromARGB(159, 132, 69, 226),),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 249, 249, 249)))),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor confirme su contraseña';
                    }
                    if (value != _passwordController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: () {
                      if(_formValidate.currentState?.validate() ?? true){
                          Navigator.pushNamed(context, "/home");
                      }
                    },
                    child: Text('Registrar'),
                    
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/iniciarsesion");
                    },
                    child: Text('Iniciar Sesion'),
                  ),
                ])
              ]),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
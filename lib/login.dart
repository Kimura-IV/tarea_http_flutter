import 'package:flutter/material.dart';

import 'main.dart';

class MyLogIn extends StatefulWidget {
  const MyLogIn({Key? key}) : super(key: key);

  @override
  State<MyLogIn> createState() => _MyLogInState();
}

class _MyLogInState extends State<MyLogIn> {
  final user = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    user.dispose();
    password.dispose();
    super.dispose();
  }

  // Método para manejar la autenticación
void authenticate(BuildContext context) {
  String username = user.text;
  String pwd = password.text;

  if (username == 'administrador' && pwd == 'admin') {
    // Autenticación exitosa, navegamos a la página de noticias
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(title: 'Tarea - Últimas Noticias'),
      ),
    );
  } else {
    // Autenticación fallida, muestra un mensaje de error.
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error de autenticación'),
        content: Text('Usuario o contraseña incorrectos.'),
        actions: <Widget>[
          TextButton(
            child: Text('Cerrar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white, //color de backgorund
      body: Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 40, 50, 103),
            Color.fromARGB(255, 27, 28, 42)
          ], begin: Alignment.topCenter),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: 30.0, vertical: 100.0), //anadir padding
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //imagen
                const CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('../images/logo_cinefile.png'),
                ),

                //Titulo del form
                const Text(
                  'Iniciar Sesion',
                  style: TextStyle(
                      fontFamily: 'FredokaOne',
                      fontSize: 40.0,
                      color: Colors.white),
                ),

                //espacio?
                const SizedBox(
                  height: 30.0,
                ),

                //Campos del formulario
                const Text(
                  'Nombre de Usuario',
                  style: TextStyle(
                      fontFamily: 'FredokaOne',
                      fontSize: 20.0,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),

                const SizedBox(
                  height: 15.0,
                ),

                //user field
                TextField(
                  controller: user,
                  enableInteractiveSelection:
                      false, //desactivar interactividad por defecto
                  autofocus: true, //activar focus por defecto
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(fontFamily: 'Fresca'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: const Icon(Icons.person),
                    hintText: 'Usuario',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15.0,
                ),

                const Text(
                  'Contraseña',
                  style: TextStyle(
                      fontFamily: 'FredokaOne',
                      fontSize: 20.0,
                      color: Colors.white),
                ),

                const SizedBox(
                  height: 15.0,
                ),

                //password field
                TextField(
                  controller: password,
                  enableInteractiveSelection:
                      false, //desactivar interactividad por defecto
                  autofocus: true, //activar focus por defecto
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(fontFamily: 'Fresca'),
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: const Icon(Icons.password),
                    hintText: 'Contraseña',
                    //labelText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 40.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: MaterialButton(
                        color: Color.fromARGB(255, 59, 66, 114),
                        height: 50.0,
                        minWidth: 155.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const Text(
                          'Aceptar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: 'FredokaOne'),
                        ),
                        onPressed: () {
                          authenticate(context); // Llamamos al método de autenticación al presionar el botón "Aceptar"
                        },
                      ),
                    ),
                    Flexible(
                      child: MaterialButton(
                        onPressed: () {
                          print(
                              'Esperamos volverlo a ver pronto. \nSaliendo del sistema........');
                        },
                        color: Color.fromARGB(255, 158, 178, 187),
                        height: 50.0,
                        minWidth: 155.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const Text(
                          'Salir',
                          style: TextStyle(
                              color: Color.fromARGB(255, 43, 63, 181),
                              fontSize: 25.0,
                              fontFamily: 'FredokaOne'),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
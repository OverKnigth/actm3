import 'package:act_01/screens/screen2.dart';
import 'package:act_01/screens/screen3.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const Actividad());
}

class Actividad extends StatelessWidget {
  const Actividad({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/736x/f0/89/be/f089be729743cdd611b9489b6ca4e3d1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Actividad Autónoma',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 3.0,
                      color: Color.fromARGB(96, 111, 109, 109),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              const Text(
                'Nombre: Stalin Moposita',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 2.0,
                      color: Color.fromARGB(96, 111, 109, 109),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                  onPressed: () => navegar1(context),
                  label: Text(
                    "Iniciar Sesión",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  icon: Icon(Icons.login, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 15),
                    backgroundColor: Colors.blue,
                  )),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => navegar2(context),
                label: Text(
                  "Registrarse",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                icon: Icon(Icons.person_add, color: Colors.white),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    backgroundColor: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void navegar1(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Screen2()));
}

void navegar2(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Screen3()));
}

import 'package:act_01/screens/screen4.dart';
import 'package:act_01/screens/screen5.dart';
import 'package:act_01/screens/screen6.dart';
import 'package:act_01/screens/screen7.dart';
import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
           ListTile(
            title: Text("Agregar Producto"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen4())),
          ),
          ListTile(
            title: Text("Modificar o Eliminar Producto"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen5())),
          ),
          ListTile(
            title: Text("Lista de Productos"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen6())),
          ),
          ListTile(
            title: Text("Detalles de Productos"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen7())),
          ),
        ],
      ),
    );
  }
}

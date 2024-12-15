import 'package:act_01/navegadores/drawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    final _baseDeDatos = FirebaseDatabase.instance.ref("productos");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lista de Productos",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: MiDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/736x/b6/9e/d7/b69ed7e98bf3b148aa9e009cdec2f02c.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: _baseDeDatos.get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Error al cargar los productos'));
            }

            if (!snapshot.hasData ||
                (snapshot.data!.value as Map?)?.isEmpty == true) {
              return const Center(child: Text('No hay productos registrados'));
            }

            final productos = (snapshot.data!.value as Map).entries.toList();

            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final producto = productos[index];
                final id = producto.key;
                final data = producto.value as Map;

                return Card(
                  color: Colors.white.withOpacity(0.8),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(
                      "${data['name']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text("ID: $id\nPrecio: \$${data['price']}"),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

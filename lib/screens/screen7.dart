import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Screen7 extends StatelessWidget {
  const Screen7({super.key});

  @override
  Widget build(BuildContext context) {
    final _baseDeDatos = FirebaseDatabase.instance.ref("productos");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detalles de Productos",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/736x/37/05/11/370511aa83fdb8f9a718f12ff3ab1afa.jpg"),
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
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nombre: ${data['name']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Descripción: ${data['description']}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Precio: \$${data['price']}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "ID: $id",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
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

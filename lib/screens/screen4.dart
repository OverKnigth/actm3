import 'package:act_01/navegadores/drawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    final _idController = TextEditingController();
    final _nombreController = TextEditingController();
    final _descripcionController = TextEditingController();
    final _precioController = TextEditingController();
    final _baseDeDatos = FirebaseDatabase.instance.ref("productos");

    void _agregarProducto() async {
      if (_idController.text.trim().isEmpty ||
          _nombreController.text.trim().isEmpty ||
          _descripcionController.text.trim().isEmpty ||
          _precioController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Complete todos los campos')),
        );
        return;
      }

      try {
        await _baseDeDatos.child(_idController.text.trim()).set({
          "name": _nombreController.text.trim(),
          "description": _descripcionController.text.trim(),
          "price": double.tryParse(_precioController.text.trim()) ?? 0.0,
          "date": DateTime.now().toIso8601String(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Producto agregado')),
        );

        _idController.clear();
        _nombreController.clear();
        _descripcionController.clear();
        _precioController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al agregar el producto')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Productos",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      drawer: MiDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/736x/81/da/c3/81dac3b27ad0fcfb65bf4b77ebe456ca.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _idController,
                decoration: const InputDecoration(labelText: 'ID'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _descripcionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _precioController,
                decoration: const InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _agregarProducto,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon: const Icon(Icons.add, color: Colors.white),
                label: Text(
                  "Agregar",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

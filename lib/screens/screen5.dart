import 'package:act_01/navegadores/drawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    final _idController = TextEditingController();
    final _nombreController = TextEditingController();
    final _descripcionController = TextEditingController();
    final _precioController = TextEditingController();
    final _baseDeDatos = FirebaseDatabase.instance.ref("productos");

    void _buscarProducto() async {
      if (_idController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, ingrese un ID válido')),
        );
        return;
      }

      try {
        final snapshot =
            await _baseDeDatos.child(_idController.text.trim()).get();

        if (snapshot.exists) {
          final data = snapshot.value as Map;
          _nombreController.text = data['name'] ?? '';
          _descripcionController.text = data['description'] ?? '';
          _precioController.text = data['price']?.toString() ?? '';
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No se encontró el producto')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Error al buscar el producto: ${e.toString()}')),
        );
      }
    }

    void _modificarProducto() async {
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
        await _baseDeDatos.child(_idController.text.trim()).update({
          "name": _nombreController.text.trim(),
          "description": _descripcionController.text.trim(),
          "price": double.tryParse(_precioController.text.trim()) ?? 0.0,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Producto modificado correctamente')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Error al modificar el producto: ${e.toString()}')),
        );
      }
    }

    void _eliminarProducto() async {
      if (_idController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, ingrese un ID válido')),
        );
        return;
      }

      try {
        await _baseDeDatos.child(_idController.text.trim()).remove();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Producto eliminado correctamente')),
        );

        _idController.clear();
        _nombreController.clear();
        _descripcionController.clear();
        _precioController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Error al eliminar el producto: ${e.toString()}')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Modificar o Eliminar Producto",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: MiDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/736x/49/db/a3/49dba33069acb8b175c10060a14598db.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _idController,
                decoration: const InputDecoration(labelText: 'ID del Producto'),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _buscarProducto,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                label: Text("Buscar Producto", style: TextStyle(color: Colors.white)),
                icon: Icon(Icons.search, color: Colors.white),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      onPressed: _modificarProducto,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      label: Text("Modificar",
                          style: TextStyle(color: Colors.white)),
                      icon: Icon(Icons.edit, color: Colors.white)),
                  ElevatedButton.icon(
                      onPressed: _eliminarProducto,
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      label: Text("Eliminar",
                          style: TextStyle(color: Colors.white)),
                      icon: Icon(Icons.delete, color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

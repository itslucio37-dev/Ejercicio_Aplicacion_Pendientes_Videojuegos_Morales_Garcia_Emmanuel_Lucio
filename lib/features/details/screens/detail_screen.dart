import 'package:flutter/material.dart';
import 'package:ap_videojuegos_pendientes/features/home/models/item.dart';

class DetailScreen extends StatelessWidget {
  final Item item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.titulo)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Detalles del elemento'),
            const SizedBox(height: 16.0),
            Text('Título: ${item.titulo}'),
            Text('Categoría: ${item.categoria}'),
            Text('Completado: ${item.completado ? "Sí" : "No"}'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Volver"),
            ),
          ],
        ),
      ),
    );
  }
}
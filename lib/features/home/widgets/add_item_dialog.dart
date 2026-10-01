import 'package:flutter/material.dart';
import 'package:ap_videojuegos_pendientes/features/home/models/item.dart';

class AddItemDialog extends StatefulWidget {
  const AddItemDialog({super.key});

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final TextEditingController _tituloController = TextEditingController();

  final List<String> categorias = ['PC', 'XBOX', 'PLAYSTATION', 'NINTENDO'];
  String categoriaSeleccionada = 'PC';

  @override
  void dispose() {
    _tituloController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Agregar videojuego'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _tituloController,
            decoration: const InputDecoration(labelText: 'Título'),
          ),
          const SizedBox(height: 16.0),
          DropdownButton<String>(
            value: categoriaSeleccionada,
            isExpanded: true,
            items: categorias.map((categoria) {
              return DropdownMenuItem<String>(
                value: categoria,
                child: Text(categoria),
              );
            }).toList(),
            onChanged: (nuevoValor) {
              setState(() {
                categoriaSeleccionada = nuevoValor!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_tituloController.text.trim().isEmpty) {
              return;
            }
            Navigator.pop(
              context,
              Item(
                titulo: _tituloController.text.trim(),
                categoria: categoriaSeleccionada,
              ),
            );
          },
          child: const Text('Agregar'),
        ),
      ],
    );
  }
}
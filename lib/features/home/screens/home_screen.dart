import 'package:flutter/material.dart';
import 'package:ap_videojuegos_pendientes/features/home/models/item.dart';
import 'package:ap_videojuegos_pendientes/features/home/widgets/add_item_dialog.dart';
import 'package:ap_videojuegos_pendientes/features/home/widgets/interactive_item_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> itemList = [
    Item(titulo: "The Legend of Zelda", categoria: "NINTENDO"),
    Item(titulo: "God of War", categoria: "PLAYSTATION"),
    Item(titulo: "Halo Infinite", categoria: "XBOX"),
    Item(titulo: "Hollow Knight", categoria: "PC"),
  ];

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _mostrarFormulario() async {
    final nuevoItem = await showDialog<Item>(
      context: context,
      builder: (context) => const AddItemDialog(),
    );

    if (nuevoItem != null) {
      setState(() {
        itemList.add(nuevoItem);
      });
      if (!mounted) return;
      _mostrarMensaje('Juego agregado correctamente');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: const Text("Backlog Tracker"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarFormulario,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  final currentItem = itemList[index];
                  return Dismissible(
                    key: ObjectKey(currentItem),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        itemList.removeAt(index);
                      });
                      _mostrarMensaje('Juego eliminado correctamente');
                    },
                    child: InteractiveItemCard(item: currentItem),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
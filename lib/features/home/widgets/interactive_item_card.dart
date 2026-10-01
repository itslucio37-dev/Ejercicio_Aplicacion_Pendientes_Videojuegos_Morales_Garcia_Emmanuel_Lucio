import 'package:flutter/material.dart';
import 'package:ap_videojuegos_pendientes/features/details/screens/detail_screen.dart';
import 'package:ap_videojuegos_pendientes/features/home/models/item.dart';

class InteractiveItemCard extends StatefulWidget {
  final Item item;

  const InteractiveItemCard({super.key, required this.item});

  @override
  State<InteractiveItemCard> createState() => _InteractiveItemCardState();
}

class _InteractiveItemCardState extends State<InteractiveItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.item.completado ? Colors.green.shade100 : Colors.white,
      elevation: 4,
      child: ListTile(
        title: Text(widget.item.titulo),
        subtitle: Text(widget.item.categoria),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(item: widget.item),
            ),
          );
        },
        trailing: IconButton(
          onPressed: () {
            setState(() {
              widget.item.completado = !widget.item.completado;
            });
          },
          icon: Icon(
            widget.item.completado
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            color: widget.item.completado ? Colors.green : Colors.grey,
          ),
        ),
      ),
    );
  }
}
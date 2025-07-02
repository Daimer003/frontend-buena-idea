import 'package:flutter/material.dart';

class EnviosGratisScreen extends StatelessWidget {
  const EnviosGratisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productosGratis = [
      {'nombre': 'Gorra Adidas', 'comercio': 'Moda Sport', 'precio': '\$30'},
      {'nombre': 'Audífonos', 'comercio': 'ElectroShop', 'precio': '\$45'},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Envíos Gratis', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: productosGratis.length,
        itemBuilder: (context, index) {
          final producto = productosGratis[index];
          return ListTile(
            title: Text(producto['nombre']!, style: const TextStyle(color: Colors.white)),
            subtitle: Text(producto['comercio']!, style: const TextStyle(color: Colors.white70)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.local_shipping, color: Colors.greenAccent),
                const SizedBox(width: 8),
                Text(producto['precio']!, style: const TextStyle(color: Colors.greenAccent)),
              ],
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

class OfertasScreen extends StatelessWidget {
  const OfertasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ofertas = [
      {'nombre': 'Zapatos Nike', 'comercio': 'Deportes XYZ', 'precio': '\$120'},
      {'nombre': 'Smartwatch', 'comercio': 'TechStore', 'precio': '\$85'},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Ofertas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: ofertas.length,
        itemBuilder: (context, index) {
          final producto = ofertas[index];
          return ListTile(
            title: Text(producto['nombre']!, style: const TextStyle(color: Colors.white)),
            subtitle: Text(producto['comercio']!, style: const TextStyle(color: Colors.white70)),
            trailing: Text(producto['precio']!, style: const TextStyle(color: Colors.greenAccent)),
          );
        },
      ),
    );
  }
}
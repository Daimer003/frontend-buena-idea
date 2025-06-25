// screens/comercio_screen.dart
import 'package:flutter/material.dart';

class ComercioScreen extends StatelessWidget {
  final String name;
  final String imagePath;

  const ComercioScreen({required this.name, required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        children: [
          Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity, height: 250),
          const SizedBox(height: 16),
          Text(name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Aquí puedes mostrar información del comercio, contacto, ubicación, etc."),
          ),
        ],
      ),
    );
  }
}
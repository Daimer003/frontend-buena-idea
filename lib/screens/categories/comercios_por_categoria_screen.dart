import 'package:flutter/material.dart';
import '../tienda/tienda_screen.dart';


class ComerciosPorCategoriaScreen extends StatelessWidget {
  final String categoria;

  const ComerciosPorCategoriaScreen({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    // Comercios enfocados en mascotas
    final comercios = [
      {
        'nombre': 'Mundo Peludo',
        'productos': 120,
        'descripcion': 'Alimentos premium para perros y gatos.',
      },
      {
        'nombre': 'PetLand Express',
        'productos': 95,
        'descripcion': 'Accesorios, juguetes y camas cómodas.',
      },
      {
        'nombre': 'Vet&Care',
        'productos': 60,
        'descripcion': 'Farmacia veterinaria y cuidado de salud.',
      },
      {
        'nombre': 'Mascota Feliz',
        'productos': 80,
        'descripcion': 'Todo para consentir a tu mejor amigo.',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Tiendas de $categoria', style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: comercios.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final comercio = comercios[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetalleTiendaScreen(
                      nombre: comercio['nombre'] as String,
                      descripcion: comercio['descripcion'] as String,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        'assets/tienda.jpg',
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comercio['nombre'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${comercio['productos']} productos',
                            style: const TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            comercio['descripcion'] as String,
                            style: const TextStyle(color: Colors.white60, fontSize: 11),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
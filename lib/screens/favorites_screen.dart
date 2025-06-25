import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  final List<Map<String, String>> mockFavorites = const [
    {
      'name': 'Cama para perro grande',
      'image': 'https://via.placeholder.com/150',
      'price': '\$120.000',
    },
    {
      'name': 'Juguete interactivo para gato',
      'image': 'https://via.placeholder.com/150',
      'price': '\$35.000',
    },
    {
      'name': 'Collar con GPS para perros',
      'image': 'https://via.placeholder.com/150',
      'price': '\$250.000',
    },
    {
      'name': 'Transportadora plegable',
      'image': 'https://m.media-amazon.com/images/I/71NCqSDcE-L.jpg',
      'price': '\$95.000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Favoritos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockFavorites.length,
        itemBuilder: (context, index) {
          final product = mockFavorites[index];
          return _buildFavoriteItem(
            name: product['name']!,
            imageUrl: product['image']!,
            price: product['price']!,
          );
        },
      ),
    );
  }

  Widget _buildFavoriteItem({
    required String name,
    required String imageUrl,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2C2C2E)),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          price,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.favorite, color: Colors.redAccent),
          onPressed: () {
            // Aquí puedes implementar lógica para quitar de favoritos
          },
        ),
      ),
    );
  }
}
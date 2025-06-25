import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// importa la nueva pantalla

class HomeScreen extends StatefulWidget {
  final bool isVip;
  const HomeScreen({required this.isVip, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/background.mp4")
      ..setLooping(true)
      ..setVolume(0)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          if (_controller.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),

          // Degradado
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment(0, -0.8),
                  colors: [Colors.black, Colors.transparent],
                ),
              ),
            ),
          ),

          // Contenido
          ListView(
            padding: const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 24),
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Hola, bienvenido(a)",
                        style: TextStyle(color: Colors.redAccent, fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    const Text("¿Qué quieres ver hoy?",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text(
                      "Explora cientos de productos para tus mascotas, ropa exclusiva y las mejores ofertas en un solo lugar.",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      children: [
                        _buildOptionButton(Icons.category, 'Categorias', () {}),
                        _buildOptionButton(Icons.local_offer, 'Ofertas', () {}),
                        _buildOptionButton(Icons.send, 'Envios gratuitos', () {}),
                        _buildOptionButton(Icons.location_on, 'Ubicación', () {}),
                        _buildOptionButton(Icons.contact_mail, 'Contacto', () {}),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("Pauta con nosotros", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              const Text("Productos",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 12),
              SizedBox(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildRestaurantCard("Juguete", "assets/juguete.jpg"),
                    _buildRestaurantCard("Juguete", "assets/juguete-2.jpg"),
                    _buildRestaurantCard("Comida", "assets/verduras-buenas-para-perros.png"),
                  ],
                ),
              ),

              const SizedBox(height: 32),
              const Text("Ofertas",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 8),
              const Text("Descubre las promociones más deliciosas que tenemos para ti.",
                  style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 12),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/verduras-buenas-para-perros.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.green,
                      child: Icon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 18),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white10,
            child: Icon(icon, color: Colors.white, size: 28),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildRestaurantCard(String name, String imagePath) {
    return Stack(
      children: [
        Container(
          width: 240,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
          ),
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(8),
          child: Text(name,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        Positioned(
          bottom: 8,
          right: 20,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.green,
            child: Icon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 18),
          ),
        ),
      ],
    );
  }
}
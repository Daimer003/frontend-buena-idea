import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetalleProductoScreen extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final double precio;
  final String imageUrl;

  const DetalleProductoScreen({
    super.key,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.imageUrl,
  });

  void _enviarMensajeWhatsApp() async {
    final url = Uri.parse('https://wa.me/573001112233?text=Hola,%20quiero%20comprar:%20$nombre');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // Aquí puedes mostrar un mensaje de error si WhatsApp no está disponible
      debugPrint('No se pudo abrir WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(nombre, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              nombre,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              descripcion,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Cantidad: 1',
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 8),
            Text(
              'Precio: \$${precio.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white, // color del texto e ícono
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: _enviarMensajeWhatsApp,
                icon: const FaIcon(FontAwesomeIcons.whatsapp),
                label: const Text('Comprar por WhatsApp'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
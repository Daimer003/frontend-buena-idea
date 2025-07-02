import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'detalle_producto_screen.dart';

class DetalleTiendaScreen extends StatelessWidget {
  final String nombre;
  final String descripcion;

  const DetalleTiendaScreen({
    super.key,
    required this.nombre,
    required this.descripcion,
  });

  void _contactarPorWhatsApp() async {
    final url = Uri.parse('https://wa.me/573001112233?text=Hola,%20quiero%20más%20información%20sobre%20la%20tienda%20$nombre');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  void _mostrarFormularioAgregarProducto(
      BuildContext context,
      void Function(Map<String, dynamic>) onProductoAgregado,
      ) {
    final tituloController = TextEditingController();
    final descripcionController = TextEditingController();
    final cantidadController = TextEditingController();
    final precioController = TextEditingController();

    final List<File?> imagenes = [null, null, null];
    final picker = ImagePicker();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              left: 16,
              right: 16,
              top: 24,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text("Agregar producto",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3, (i) {
                      return GestureDetector(
                        onTap: () async {
                          final picked = await picker.pickImage(source: ImageSource.gallery);
                          if (picked != null) {
                            setState(() {
                              imagenes[i] = File(picked.path);
                            });
                          }
                        },
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(12),
                            image: imagenes[i] != null
                                ? DecorationImage(image: FileImage(imagenes[i]!), fit: BoxFit.cover)
                                : null,
                          ),
                          child: imagenes[i] == null
                              ? const Icon(Icons.add_a_photo, color: Colors.white60)
                              : null,
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 16),
                  _campoTexto("Título del producto", tituloController),
                  const SizedBox(height: 12),
                  _campoTexto("Descripción", descripcionController, maxLines: 3),
                  const SizedBox(height: 12),
                  _campoTexto("Cantidad disponible", cantidadController, tipo: TextInputType.number),
                  const SizedBox(height: 12),
                  _campoTexto("Precio", precioController, tipo: TextInputType.number),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (tituloController.text.isNotEmpty &&
                            precioController.text.isNotEmpty &&
                            imagenes.any((img) => img != null)) {
                          onProductoAgregado({
                            'nombre': tituloController.text,
                            'descripcion': descripcionController.text,
                            'cantidad': int.tryParse(cantidadController.text) ?? 1,
                            'precio': double.tryParse(precioController.text) ?? 0.0,
                            'imagenes': imagenes.whereType<File>().toList(),
                          });
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: const Text("Guardar producto"),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Widget _campoTexto(String label, TextEditingController controller, {int maxLines = 1, TextInputType tipo = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: tipo,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white24),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productos = List.generate(8, (index) => 'Producto ${index + 1}');

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(nombre, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/tienda.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                descripcion,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: _contactarPorWhatsApp,
                    icon: const Icon(Icons.chat),
                    label: const Text('WhatsApp'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () => _mostrarFormularioAgregarProducto(context, (producto) {
                      // Aquí puedes añadir lógica para añadir a una lista real
                      print("Producto agregado: $producto");
                    }),
                    icon: const Icon(Icons.add),
                    label: const Text('Agregar'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/tienda.jpg',
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Productos disponibles',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetalleProductoScreen(
                          nombre: productos[index],
                          descripcion: 'Este es un producto exclusivo para tu mascota.',
                          precio: 12900.0,
                          imageUrl: 'assets/producto.jpg',
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
                            'assets/producto.jpg',
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
                                productos[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Descripción breve',
                                style: TextStyle(color: Colors.white70, fontSize: 12),
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
          ],
        ),
      ),
    );
  }
}
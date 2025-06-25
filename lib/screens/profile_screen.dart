import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _logout(BuildContext context) {
    // Lógica para cerrar sesión
  }

  void _editUser(BuildContext context) {
    // Navegar o abrir modal para editar usuario
  }

  void _changePassword(BuildContext context) {
    // Navegar o abrir modal para cambiar contraseña
  }

  void _createBusinessAccount(BuildContext context) {
    // Navegar a registro de cuenta de negocio
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Perfil',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Configuración',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),

                    _buildOption(
                      context,
                      icon: CupertinoIcons.pencil,
                      label: 'Editar usuario',
                      onTap: () => _editUser(context),
                    ),

                    const SizedBox(height: 16),

                    _buildOption(
                      context,
                      icon: CupertinoIcons.lock,
                      label: 'Cambiar contraseña',
                      onTap: () => _changePassword(context),
                    ),

                    const SizedBox(height: 16),

                    _buildOption(
                      context,
                      icon: CupertinoIcons.power,
                      label: 'Cerrar sesión',
                      onTap: () => _logout(context),
                      color: Colors.redAccent,
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: ElevatedButton(
                onPressed: () => _createBusinessAccount(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, // Amarillo
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  'Crear cuenta de negocio',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOption(
      BuildContext context, {
        required IconData icon,
        required String label,
        required VoidCallback onTap,
        Color color = const Color(0xFF1C1C1E),
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF2C2C2E)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
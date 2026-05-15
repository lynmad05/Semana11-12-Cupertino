import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Perfil", style: TextStyle(color: Colors.white))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF577FCD),
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text("Ailyn Medina",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF253F7C))),
            SizedBox(height: 8),
            Text("22 años", style: TextStyle(color: Colors.black54)),
            Text("Callao, Perú", style: TextStyle(color: Colors.black54)),
            SizedBox(height: 8),
            Chip(
              label: Text("Admin", style: TextStyle(color: Colors.white)),
              backgroundColor: Color(0xFF577FCD),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ListarAlumnosScreen extends StatelessWidget {
  final List<String> alumnos = [
    "Juan - 20 - Nazca",
    "Maria - 21 - Lima",
    "Pedro - 22 - Arequipa",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alumnos", style: TextStyle(color: Colors.white))),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: alumnos.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Color(0xFFDDE8F8))),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF577FCD),
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(alumnos[index],
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

class PreguntasFrecuentesScreen extends StatelessWidget {
  final List<String> preguntas = [
    "¿Cómo registro a un alumno?",
    "¿Cómo cambio contraseña?",
    "¿Cómo contacto soporte?",
  ];

  final List<String> respuestas = [
    "Ingresa a la opción de registrar en el menú.",
    "En configuración.",
    "Por correo o teléfono.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preguntas", style: TextStyle(color: Colors.white))),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: preguntas.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Color(0xFFDDE8F8))),
            margin: EdgeInsets.only(bottom: 10),
            child: ExpansionTile(
              title: Text(preguntas[index],
                  style: TextStyle(fontWeight: FontWeight.w500,
                      color: Color(0xFF253F7C))),
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(respuestas[index],
                      style: TextStyle(color: Colors.black54)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
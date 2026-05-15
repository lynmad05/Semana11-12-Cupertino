import 'package:flutter/material.dart';
import 'perfil_screen.dart';
import 'registrar_alumnos_screen.dart';
import 'listar_alumnos_screen.dart';
import 'preguntas_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> items = [
    "Perfil",
    "Registrar alumno",
    "Listar alumnos",
    "Preguntas",
    "Cerrar sesión",
  ];

  final List<IconData> icons = [
    Icons.account_circle_outlined,
    Icons.person_add_outlined,
    Icons.group_outlined,
    Icons.help_outline,
    Icons.logout,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menú", style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final bool isLogout = index == items.length - 1;

          return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Card(
              color: isLogout ? Color(0xFFFDE0DD) : Color(0xFF577FCD),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(
                  icons[index],
                  color: isLogout ? Color(0xFFA32D2D) : Colors.white,
                ),
                title: Text(
                  items[index],
                  style: TextStyle(
                    color: isLogout ? Color(0xFFA32D2D) : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: isLogout ? Color(0xFFA32D2D) : Colors.white70,
                ),
                onTap: () {
                  if (isLogout) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                      (route) => false,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => getPage(index)),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return PerfilScreen();
      case 1:
        return RegistrarScreen();
      case 2:
        return ListarAlumnosScreen();
      case 3:
        return PreguntasFrecuentesScreen();
      default:
        return HomeScreen();
    }
  }
}

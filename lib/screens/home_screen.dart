import 'package:flutter/cupertino.dart';
import 'perfil_screen.dart';
import 'registrar_alumnos_screen.dart';
import 'listar_alumnos_screen.dart';
import 'preguntas_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_MenuItem> items = [
      _MenuItem(
        label: 'Perfil',
        subtitle: 'Ver tu información',
        icon: CupertinoIcons.person_circle_fill,
        iconColor: const Color(0xFF3A6BC9),
        bgColor: const Color(0xFFE8EFFE),
        page: const PerfilScreen(),
      ),
      _MenuItem(
        label: 'Registrar alumno',
        subtitle: 'Añadir nuevo estudiante',
        icon: CupertinoIcons.person_badge_plus_fill,
        iconColor: const Color(0xFF2E80B4),
        bgColor: const Color(0xFFE3F3FC),
        page: const RegistrarScreen(),
      ),
      _MenuItem(
        label: 'Listar alumnos',
        subtitle: 'Ver todos los estudiantes',
        icon: CupertinoIcons.group_solid,
        iconColor: const Color(0xFF1C6B9E),
        bgColor: const Color(0xFFDDF0FB),
        page: const ListarAlumnosScreen(),
      ),
      _MenuItem(
        label: 'Preguntas frecuentes',
        subtitle: 'Ayuda y soporte',
        icon: CupertinoIcons.chat_bubble_2_fill,
        iconColor: const Color(0xFF4F7EC9),
        bgColor: const Color(0xFFEBF0FD),
        page: const PreguntasFrecuentesScreen(),
      ),
    ];

    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF2F6FC),
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Menú principal',
          style: TextStyle(
            color: Color(0xFF1C3A7A),
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0xFFF2F6FC),
        border: Border(bottom: BorderSide(color: CupertinoColors.transparent)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // Header saludo
              const Text(
                'Bienvenida Ailyn',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C3A7A),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '¿Qué quieres hacer hoy?',
                style: TextStyle(
                  fontSize: 15,
                  color: CupertinoColors.systemGrey,
                ),
              ),

              const SizedBox(height: 28),

              // Opciones del menú
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    return _MenuCard(item: items[index]);
                  },
                ),
              ),

              const SizedBox(height: 16),

              // Botón cerrar sesión
              GestureDetector(
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      title: const Text('Cerrar sesión'),
                      content: const Text('¿Estás segura que deseas salir?'),
                      actions: [
                        CupertinoDialogAction(
                          isDestructiveAction: false,
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancelar'),
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(builder: (_) => const LoginScreen()),
                              (route) => false,
                            );
                          },
                          child: const Text('Cerrar sesión'),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDE8E8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.square_arrow_left,
                        color: Color(0xFFA32D2D),
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Cerrar sesión',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA32D2D),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final _MenuItem item;
  const _MenuCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (_) => item.page),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF3A6BC9).withOpacity(0.09),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: item.bgColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(item.icon, color: item.iconColor, size: 26),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C3A7A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_right,
              color: CupertinoColors.systemGrey3,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final String label;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final Widget page;

  const _MenuItem({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.page,
  });
}
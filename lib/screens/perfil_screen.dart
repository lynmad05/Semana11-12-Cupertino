import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF2F6FC),
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Perfil',
          style: TextStyle(
            color: Color(0xFF1C3A7A),
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0xFFF2F6FC),
        border: Border(bottom: BorderSide(color: CupertinoColors.transparent)),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 32),

              // Avatar
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3A6BC9), Color(0xFF1C3A7A)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF3A6BC9).withOpacity(0.35),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        CupertinoIcons.person_fill,
                        size: 54,
                        color: CupertinoColors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (_) => CupertinoAlertDialog(
                            title: const Text('Cambiar foto'),
                            content: const Text(
                                'Esta función estará disponible en una próxima versión.'),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Entendido'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: CupertinoColors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFF2F6FC),
                            width: 3,
                          ),
                        ),
                        child: const Icon(
                          CupertinoIcons.camera_fill,
                          size: 16,
                          color: Color(0xFF3A6BC9),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Ailyn Medina',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C3A7A),
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 6),

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3A6BC9), Color(0xFF1C3A7A)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Administrador',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 36),

              _InfoCard(items: const [
                _InfoRow(
                  icon: CupertinoIcons.calendar,
                  label: 'Edad',
                  value: '22 años',
                ),
                _InfoRow(
                  icon: CupertinoIcons.location_solid,
                  label: 'Ubicación',
                  value: 'Callao, Perú',
                ),
                _InfoRow(
                  icon: CupertinoIcons.mail_solid,
                  label: 'Correo',
                  value: 'ailyn.medina@tecsup.edu.pe',
                ),
              ]),

              const SizedBox(height: 20),

              // Botón editar perfil
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF3A6BC9).withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: CupertinoButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  borderRadius: BorderRadius.circular(16),
                  color: CupertinoColors.white,
                  onPressed: () {
                    // Muestra ActionSheet con opciones de edición
                    showCupertinoModalPopup(
                      context: context,
                      builder: (_) => CupertinoActionSheet(
                        title: const Text('Editar perfil'),
                        message: const Text('¿Qué deseas actualizar?'),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                              _mostrarEdicionCampo(
                                  context, 'Nombre', 'Ailyn Medina');
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.person,
                                    size: 18, color: Color(0xFF3A6BC9)),
                                SizedBox(width: 8),
                                Text('Cambiar nombre'),
                              ],
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                              _mostrarEdicionCampo(
                                  context, 'Correo', 'ailyn.medina@tecsup.edu.pe');
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.mail,
                                    size: 18, color: Color(0xFF3A6BC9)),
                                SizedBox(width: 8),
                                Text('Cambiar correo'),
                              ],
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                              _mostrarCambioContrasena(context);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.lock,
                                    size: 18, color: Color(0xFF3A6BC9)),
                                SizedBox(width: 8),
                                Text('Cambiar contraseña'),
                              ],
                            ),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancelar'),
                        ),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.pencil,
                          color: Color(0xFF3A6BC9), size: 18),
                      SizedBox(width: 8),
                      Text(
                        'Editar perfil',
                        style: TextStyle(
                          color: Color(0xFF3A6BC9),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarEdicionCampo(
      BuildContext context, String campo, String valorActual) {
    final controller = TextEditingController(text: valorActual);

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text('Editar $campo'),
        content: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CupertinoTextField(
            controller: controller,
            autofocus: true,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              showCupertinoDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: const Text('Cambios guardados'),
                  content: Text('$campo actualizado correctamente.'),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Text(
              'Guardar',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarCambioContrasena(BuildContext context) {
    final actualCtrl = TextEditingController();
    final nuevaCtrl = TextEditingController();

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text('Cambiar contraseña'),
        content: Column(
          children: [
            const SizedBox(height: 12),
            CupertinoTextField(
              controller: actualCtrl,
              placeholder: 'Contraseña actual',
              obscureText: true,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            CupertinoTextField(
              controller: nuevaCtrl,
              placeholder: 'Nueva contraseña',
              obscureText: true,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              showCupertinoDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: const Text('Contraseña actualizada'),
                  content: const Text(
                      'Tu contraseña fue cambiada exitosamente.'),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Text(
              'Cambiar',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final List<_InfoRow> items;
  const _InfoCard({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3A6BC9).withOpacity(0.08),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: List.generate(items.length, (i) {
          final isLast = i == items.length - 1;
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8EFFE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(items[i].icon,
                          color: const Color(0xFF3A6BC9), size: 18),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[i].label,
                          style: const TextStyle(
                            fontSize: 12,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                        Text(
                          items[i].value,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1C3A7A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (!isLast)
                const Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Divider(height: 1, color: Color(0xFFEEF2F8)),
                ),
            ],
          );
        }),
      ),
    );
  }
}

class _InfoRow {
  final IconData icon;
  final String label;
  final String value;
  const _InfoRow(
      {required this.icon, required this.label, required this.value});
}
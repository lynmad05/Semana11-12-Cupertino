import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrarScreen extends StatefulWidget {
  const RegistrarScreen({super.key});

  @override
  State<RegistrarScreen> createState() => _RegistrarScreenState();
}

class _RegistrarScreenState extends State<RegistrarScreen> {
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();

  DateTime? _fechaNacimiento;

  String get _edadTexto {
    if (_fechaNacimiento == null) return 'Seleccionar fecha';
    final hoy = DateTime.now();
    int edad = hoy.year - _fechaNacimiento!.year;
    if (hoy.month < _fechaNacimiento!.month ||
        (hoy.month == _fechaNacimiento!.month &&
            hoy.day < _fechaNacimiento!.day)) {
      edad--;
    }
    final dia = _fechaNacimiento!.day.toString().padLeft(2, '0');
    final mes = _fechaNacimiento!.month.toString().padLeft(2, '0');
    final anio = _fechaNacimiento!.year;
    return '$dia/$mes/$anio · $edad años';
  }

  void _mostrarDatePicker() {
    DateTime tempFecha = _fechaNacimiento ?? DateTime(2000, 1, 1);

    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 320,
        decoration: const BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 4),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey4,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header del picker
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: CupertinoColors.systemGrey),
                    ),
                  ),
                  const Text(
                    'Fecha de nacimiento',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C3A7A),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() => _fechaNacimiento = tempFecha);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Listo',
                      style: TextStyle(
                        color: Color(0xFF3A6BC9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1, color: Color(0xFFEEF2F8)),

            // CupertinoDatePicker — modo date (día/mes/año estilo iOS)
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: tempFecha,
                maximumDate: DateTime.now(),
                minimumYear: 1950,
                maximumYear: DateTime.now().year,
                onDateTimeChanged: (dt) => tempFecha = dt,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _guardarAlumno() {
    final nombre = _nombreController.text.trim();
    final correo = _correoController.text.trim();

    if (nombre.isEmpty || correo.isEmpty || _fechaNacimiento == null) {
      showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: const Text('Datos incompletos'),
          content: const Text(
              'Completa el nombre, fecha de nacimiento y correo antes de guardar.'),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text('Alumno registrado'),
        content: Text(
            '¿Deseas guardar a $nombre en el sistema?'),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: false,
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              // Limpia campos
              _nombreController.clear();
              _correoController.clear();
              setState(() => _fechaNacimiento = null);

              // Confirmación final
              showCupertinoDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: const Text('¡Guardado!'),
                  content: Text('$nombre fue registrado exitosamente.'),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF2F6FC),
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Registrar alumno',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),

              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F3FC),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Icon(
                    CupertinoIcons.person_badge_plus_fill,
                    color: Color(0xFF2E80B4),
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Nuevo estudiante',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C3A7A),
                    letterSpacing: -0.3,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Center(
                child: Text(
                  'Completa los datos del alumno',
                  style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey),
                ),
              ),

              const SizedBox(height: 36),

              Container(
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
                  children: [
                    // Campo nombre
                    _buildFormField(
                      label: 'Nombre completo',
                      icon: CupertinoIcons.person,
                      placeholder: 'Ej. Juan García',
                      controller: _nombreController,
                      keyboardType: TextInputType.name,
                    ),

                    const Padding(
                      padding: EdgeInsets.only(left: 56),
                      child: Divider(height: 1, color: Color(0xFFEEF2F8)),
                    ),

                    // Campo fecha (CupertinoDatePicker)
                    GestureDetector(
                      onTap: _mostrarDatePicker,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 14),
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8EFFE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                CupertinoIcons.calendar,
                                color: Color(0xFF3A6BC9),
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Fecha de nacimiento',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: CupertinoColors.systemGrey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _edadTexto,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: _fechaNacimiento == null
                                          ? CupertinoColors.systemGrey3
                                          : const Color(0xFF1C3A7A),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.chevron_right,
                              color: CupertinoColors.systemGrey3,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(left: 56),
                      child: Divider(height: 1, color: Color(0xFFEEF2F8)),
                    ),

                    // Campo correo
                    _buildFormField(
                      label: 'Correo electrónico',
                      icon: CupertinoIcons.mail,
                      placeholder: 'correo@ejemplo.com',
                      controller: _correoController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  color: const Color(0xFF3A6BC9),
                  borderRadius: BorderRadius.circular(16),
                  onPressed: _guardarAlumno,
                  child: const Text(
                    'Guardar alumno',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white,
                    ),
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

  Widget _buildFormField({
    required String label,
    required IconData icon,
    required String placeholder,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFE8EFFE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF3A6BC9), size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.systemGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                CupertinoTextField(
                  controller: controller,
                  placeholder: placeholder,
                  keyboardType: keyboardType,
                  padding: EdgeInsets.zero,
                  decoration: const BoxDecoration(),
                  style: const TextStyle(fontSize: 15, color: Color(0xFF1C3A7A)),
                  placeholderStyle: const TextStyle(
                    fontSize: 15,
                    color: CupertinoColors.systemGrey3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
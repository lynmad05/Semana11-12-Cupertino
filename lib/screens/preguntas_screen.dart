import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreguntasFrecuentesScreen extends StatefulWidget {
  const PreguntasFrecuentesScreen({super.key});

  @override
  State<PreguntasFrecuentesScreen> createState() =>
      _PreguntasFrecuentesScreenState();
}

class _PreguntasFrecuentesScreenState
    extends State<PreguntasFrecuentesScreen> {
  final List<Map<String, String>> faqs = const [
    {
      'pregunta': '¿Cómo registro a un alumno?',
      'respuesta':
          'Dirígete a la opción "Registrar alumno" en el menú principal. Completa el nombre, edad y correo del estudiante, luego presiona "Guardar alumno".',
    },
    {
      'pregunta': '¿Cómo cambio mi contraseña?',
      'respuesta':
          'Ve a tu perfil y selecciona "Editar perfil". Desde ahí encontrarás la opción para cambiar tu contraseña de acceso.',
    },
    {
      'pregunta': '¿Cómo contacto a soporte?',
      'respuesta':
          'Puedes comunicarte con soporte técnico por correo electrónico o teléfono. El equipo responde en horario de oficina, de lunes a viernes.',
    },
  ];

  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF2F6FC),
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Preguntas frecuentes',
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
              const SizedBox(height: 20),

              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3A6BC9), Color(0xFF1C3A7A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      CupertinoIcons.chat_bubble_2_fill,
                      color: CupertinoColors.white,
                      size: 36,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '¿Cómo podemos ayudarte?',
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Encuentra respuestas rápidas aquí',
                            style: TextStyle(
                              color: Color(0xFFBDD4F5),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Preguntas comunes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C3A7A),
                  letterSpacing: -0.3,
                ),
              ),

              const SizedBox(height: 14),

              // Lista de FAQs
              Expanded(
                child: ListView.separated(
                  itemCount: faqs.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final isExpanded = _expandedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _expandedIndex = isExpanded ? null : index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          color: CupertinoColors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: isExpanded
                              ? Border.all(
                                  color: const Color(0xFF3A6BC9).withOpacity(0.3),
                                  width: 1.5,
                                )
                              : null,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF3A6BC9)
                                  .withOpacity(isExpanded ? 0.12 : 0.07),
                              blurRadius: isExpanded ? 18 : 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: isExpanded
                                          ? const Color(0xFF3A6BC9)
                                          : const Color(0xFFE8EFFE),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Icon(
                                      isExpanded
                                          ? CupertinoIcons.minus
                                          : CupertinoIcons.plus,
                                      color: isExpanded
                                          ? CupertinoColors.white
                                          : const Color(0xFF3A6BC9),
                                      size: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      faqs[index]['pregunta']!,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: isExpanded
                                            ? const Color(0xFF3A6BC9)
                                            : const Color(0xFF1C3A7A),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (isExpanded) ...[
                                const SizedBox(height: 14),
                                const Padding(
                                  padding: EdgeInsets.only(left: 46),
                                  child: Divider(
                                    height: 1,
                                    color: Color(0xFFEEF2F8),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.only(left: 46),
                                  child: Text(
                                    faqs[index]['respuesta']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: CupertinoColors.systemGrey,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
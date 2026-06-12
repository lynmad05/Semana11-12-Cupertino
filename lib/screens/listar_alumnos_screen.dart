import 'package:flutter/cupertino.dart';

class ListarAlumnosScreen extends StatefulWidget {
  const ListarAlumnosScreen({super.key});

  @override
  State<ListarAlumnosScreen> createState() => _ListarAlumnosScreenState();
}

class _ListarAlumnosScreenState extends State<ListarAlumnosScreen> {
  final List<Map<String, String>> _alumnos = [
    {'nombre': 'Juan García', 'edad': '20', 'ciudad': 'Nazca'},
    {'nombre': 'María López', 'edad': '21', 'ciudad': 'Lima'},
    {'nombre': 'Pedro Ramírez', 'edad': '22', 'ciudad': 'Arequipa'},
  ];

  String _busqueda = '';

  List<Map<String, String>> get _alumnosFiltrados {
    if (_busqueda.isEmpty) return _alumnos;
    return _alumnos
        .where((a) =>
            a['nombre']!.toLowerCase().contains(_busqueda.toLowerCase()) ||
            a['ciudad']!.toLowerCase().contains(_busqueda.toLowerCase()))
        .toList();
  }

  void _mostrarAcciones(BuildContext context, Map<String, String> alumno) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        title: Text(alumno['nombre']!),
        message: Text('${alumno['ciudad']} · ${alumno['edad']} años'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              showCupertinoDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: const Text('Detalles del alumno'),
                  content: Text(
                    'Nombre: ${alumno['nombre']}\nEdad: ${alumno['edad']} años\nCiudad: ${alumno['ciudad']}',
                  ),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cerrar'),
                    ),
                  ],
                ),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.eye, size: 18, color: Color(0xFF3A6BC9)),
                SizedBox(width: 8),
                Text('Ver detalles'),
              ],
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              // Aquí iría la lógica de edición
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.pencil, size: 18, color: Color(0xFF3A6BC9)),
                SizedBox(width: 8),
                Text('Editar'),
              ],
            ),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              showCupertinoDialog(
                context: context,
                builder: (_) => CupertinoAlertDialog(
                  title: const Text('Eliminar alumno'),
                  content: Text(
                      '¿Estás seguro de que deseas eliminar a ${alumno['nombre']}? Esta acción no se puede deshacer.'),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () {
                        setState(() => _alumnos.remove(alumno));
                        Navigator.pop(context);
                      },
                      child: const Text('Eliminar'),
                    ),
                  ],
                ),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.trash, size: 18),
                SizedBox(width: 8),
                Text('Eliminar'),
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
  }

  @override
  Widget build(BuildContext context) {
    final filtrados = _alumnosFiltrados;

    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF2F6FC),
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Alumnos',
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

              CupertinoSearchTextField(
                placeholder: 'Buscar alumno...',
                onChanged: (v) => setState(() => _busqueda = v),
                style: const TextStyle(fontSize: 15, color: Color(0xFF1C3A7A)),
              ),

              const SizedBox(height: 16),

              Text(
                '${filtrados.length} estudiante${filtrados.length != 1 ? 's' : ''}',
                style: const TextStyle(
                  fontSize: 13,
                  color: CupertinoColors.systemGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: filtrados.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.search,
                              size: 48,
                              color: CupertinoColors.systemGrey3,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Sin resultados',
                              style: TextStyle(
                                color: CupertinoColors.systemGrey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        itemCount: filtrados.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final alumno = filtrados[index];
                          final initials = alumno['nombre']!
                              .split(' ')
                              .take(2)
                              .map((w) => w[0])
                              .join();

                          final colors = [
                            const Color(0xFF3A6BC9),
                            const Color(0xFF2E80B4),
                            const Color(0xFF1C6B9E),
                          ];

                          return GestureDetector(
                            onTap: () =>
                                _mostrarAcciones(context, alumno),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: CupertinoColors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF3A6BC9)
                                        .withOpacity(0.08),
                                    blurRadius: 14,
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
                                      gradient: LinearGradient(
                                        colors: [
                                          colors[index % colors.length],
                                          colors[index % colors.length]
                                              .withOpacity(0.7),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(14),
                                    ),
                                    child: Center(
                                      child: Text(
                                        initials,
                                        style: const TextStyle(
                                          color: CupertinoColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          alumno['nombre']!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF1C3A7A),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Icon(
                                              CupertinoIcons.location_solid,
                                              size: 12,
                                              color:
                                                  CupertinoColors.systemGrey,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              alumno['ciudad']!,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: CupertinoColors
                                                    .systemGrey,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            const Icon(
                                              CupertinoIcons.calendar,
                                              size: 12,
                                              color:
                                                  CupertinoColors.systemGrey,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${alumno['edad']} años',
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: CupertinoColors
                                                    .systemGrey,
                                              ),
                                            ),
                                          ],
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
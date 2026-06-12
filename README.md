# 📱 Lab Flutter – Migración Material → Cupertino (iOS)

> **Curso:** Desarrollo de Aplicaciones Web Avanzadas  
> **Semana:** 11 - 12
> **Estudiante:** Ailyn Medina  
> **Institución:** Tecsup

---

## Descripción

Este laboratorio consiste en tomar el proyecto desarrollado en la **Semana 8** (hecho con Material Design) y migrarlo completamente a **Cupertino**, el sistema de diseño nativo de iOS en Flutter. El objetivo es que la app se vea y se comporte como una aplicación real de iPhone.

Se mantuvo la paleta de colores azul original, pero se rediseñó toda la interfaz para lograr un estilo más moderno, elegante e intuitivo.

---

## 🎨 Paleta de colores

| Uso | Color |
|-----|-------|
| Primario | `#3A6BC9` |
| Oscuro / títulos | `#1C3A7A` |
| Fondo general | `#F2F6FC` |
| Destructivo | `#A32D2D` / `#FDE8E8` |

---

## Estructura del proyecto

```
lib/
├── main.dart
└── screens/
    ├── login_screen.dart
    ├── home_screen.dart
    ├── perfil_screen.dart
    ├── registrar_alumnos_screen.dart
    ├── listar_alumnos_screen.dart
    └── preguntas_screen.dart
```

---

## Pantallas

### Login
- Campos de usuario y contraseña con `CupertinoTextField`
- Botón para mostrar/ocultar contraseña
- Validación con `CupertinoAlertDialog` si los campos están vacíos o las credenciales son incorrectas
- Credenciales de prueba: **usuario:** `ailyn` · **contraseña:** `1234`

### Home
- Menú principal con tarjetas estilo iOS (sombra suave, bordes redondeados)
- Ícono + color de fondo por cada opción
- Botón "Cerrar sesión" con confirmación mediante `CupertinoAlertDialog`

### Perfil
- Avatar con gradiente y botón de cámara
- Badge de rol "Administrador"
- Tarjeta de información (edad, ubicación, correo)
- Botón "Editar perfil" que abre un `CupertinoActionSheet` con opciones:
  - Cambiar nombre
  - Cambiar correo
  - Cambiar contraseña (con campos inline en el diálogo)

### Registrar alumno
- Formulario dentro de una tarjeta
- Campo **Fecha de nacimiento** con `CupertinoDatePicker` real (rueda giratoria iOS) en modal desde abajo
- Calcula la edad automáticamente desde la fecha elegida
- Al guardar: confirmación con `CupertinoAlertDialog` y luego mensaje de éxito

### Listar alumnos
- Buscador funcional con `CupertinoSearchTextField` (filtra en tiempo real)
- Contador de estudiantes
- Avatares con iniciales y gradiente
- Al tocar un alumno se abre un `CupertinoActionSheet` con opciones:
  - Ver detalles
  - Editar
  - Eliminar (con confirmación destructiva)

### ❓ Preguntas frecuentes
- Header con gradiente
- Acordeón expandible con animación suave
- Ícono que cambia entre `+` y `−` al expandir

---

## 🔄 Comparativa: Material vs Cupertino

| Material (Semana 8) | Cupertino (Este lab) |
|---|---|
| `Scaffold` | `CupertinoPageScaffold` |
| `AppBar` | `CupertinoNavigationBar` |
| `TextField` | `CupertinoTextField` |
| `ElevatedButton` | `CupertinoButton` |
| `AlertDialog` | `CupertinoAlertDialog` |
| `showModalBottomSheet` | `showCupertinoModalPopup` |
| `ExpansionTile` | Acordeón manual con `AnimatedContainer` |
| Sin picker de fecha | `CupertinoDatePicker` |
| Sin menú de acciones | `CupertinoActionSheet` |

---

## Cómo ejecutar

```bash
# Clonar o abrir el proyecto en VS Code / Android Studio
flutter pub get
flutter run
```

> Recomendado correr en un **simulador de iPhone** o dispositivo iOS para apreciar el diseño completo.

---

## Dependencias

```yaml
dependencies:
  flutter:
    sdk: flutter
  # No se requieren paquetes externos — todo es Cupertino nativo
```

---

## Lo aprendido

- Diferencias clave entre Material Design y Cupertino en Flutter
- Uso de widgets nativos de iOS: `CupertinoDatePicker`, `CupertinoActionSheet`, `CupertinoAlertDialog`, `CupertinoSearchTextField`
- Cómo mostrar modales y bottom sheets al estilo iOS con `showCupertinoModalPopup`
- Diseño visual con gradientes, sombras y bordes redondeados usando solo widgets de Flutter

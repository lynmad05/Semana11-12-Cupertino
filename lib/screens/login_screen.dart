import 'package:flutter/cupertino.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _handleLogin() {
    final usuario = _usuarioController.text.trim();
    final password = _passwordController.text.trim();

    if (usuario.isEmpty || password.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: const Text('Campos incompletos'),
          content: const Text(
              'Por favor ingresa tu usuario y contraseña para continuar.'),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: const Text('Entendido'),
            ),
          ],
        ),
      );
      return;
    }

    // Credenciales de prueba
    if (usuario != 'ailyn' || password != '1234') {
      showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: const Text('Credenciales incorrectas'),
          content: const Text(
              'El usuario o contraseña son incorrectos. Intenta de nuevo.'),
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

    Navigator.of(context).pushReplacement(
      CupertinoPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF2F6FC),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              // Logo
              Center(
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3A6BC9), Color(0xFF1C3A7A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF3A6BC9).withOpacity(0.35),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    CupertinoIcons.book_fill,
                    color: CupertinoColors.white,
                    size: 44,
                  ),
                ),
              ),

              const SizedBox(height: 36),

              const Text(
                'Bienvenido',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C3A7A),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Inicia sesión para continuar',
                style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.systemGrey,
                ),
              ),

              const SizedBox(height: 40),

              _buildLabel('Usuario'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _usuarioController,
                placeholder: 'Tu nombre de usuario',
                icon: CupertinoIcons.person,
              ),

              const SizedBox(height: 20),

              _buildLabel('Contraseña'),
              const SizedBox(height: 8),
              _buildPasswordField(),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                        title: const Text('Recuperar contraseña'),
                        content: const Text(
                            'Contacta al administrador del sistema para restablecer tu contraseña.'),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cerrar'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(fontSize: 13, color: Color(0xFF3A6BC9)),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  color: const Color(0xFF3A6BC9),
                  borderRadius: BorderRadius.circular(16),
                  onPressed: _handleLogin,
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Hint de prueba
              Center(
                child: Text(
                  'Prueba: usuario "ailyn" · contraseña "1234"',
                  style: TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.systemGrey.withOpacity(0.7),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1C3A7A),
        letterSpacing: 0.3,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String placeholder,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3A6BC9).withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        prefix: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Icon(icon, color: const Color(0xFF3A6BC9), size: 20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: const BoxDecoration(),
        placeholderStyle: const TextStyle(
          color: CupertinoColors.systemGrey3,
          fontSize: 15,
        ),
        style: const TextStyle(fontSize: 15, color: Color(0xFF1C3A7A)),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3A6BC9).withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CupertinoTextField(
        controller: _passwordController,
        placeholder: 'Tu contraseña',
        obscureText: _obscurePassword,
        prefix: const Padding(
          padding: EdgeInsets.only(left: 14),
          child:
              Icon(CupertinoIcons.lock, color: Color(0xFF3A6BC9), size: 20),
        ),
        suffix: CupertinoButton(
          padding: const EdgeInsets.only(right: 12),
          onPressed: () =>
              setState(() => _obscurePassword = !_obscurePassword),
          child: Icon(
            _obscurePassword
                ? CupertinoIcons.eye
                : CupertinoIcons.eye_slash,
            color: const Color(0xFF3A6BC9),
            size: 20,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: const BoxDecoration(),
        placeholderStyle: const TextStyle(
          color: CupertinoColors.systemGrey3,
          fontSize: 15,
        ),
        style: const TextStyle(fontSize: 15, color: Color(0xFF1C3A7A)),
      ),
    );
  }
}
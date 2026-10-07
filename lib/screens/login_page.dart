import 'package:flutter/material.dart';
import '../models/auth_credentials.dart';
import '../theme/app_theme.dart';
import '../widgets/animated_entrance.dart';
import '../widgets/gradient_button.dart';
import '../widgets/social_icon_button.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;
  bool _loading = false;

  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final credentials = AuthCredentials(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      rememberMe: _rememberMe,
    );
    
    print('Email: ${credentials.email}');

    setState(() => _loading = true);
    await Future.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    setState(() => _loading = false);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 850;
          if (isDesktop) {
            return Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Center(
                    child: SingleChildScrollView(child: _buildFormPanel()),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: _buildVisualPanel(),
                ),
              ],
            );
          }
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 240,
                child: _buildVisualPanel(compact: true),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 190),
                  child: _buildFormPanel(mobileCard: true),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFormPanel({bool mobileCard = false}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 440),
      margin: mobileCard
          ? const EdgeInsets.all(16)
          : const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
      padding: mobileCard ? const EdgeInsets.all(28) : EdgeInsets.zero,
      decoration: mobileCard
          ? BoxDecoration(
              color: AppColors.surface.withOpacity(0.96),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                )
              ],
            )
          : null,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedEntrance(
              delay: const Duration(milliseconds: 100),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.movie_filter_rounded,
                        color: AppColors.primary, size: 24),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'AnimeLover',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textMain,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            AnimatedEntrance(
              delay: const Duration(milliseconds: 180),
              child: const Text(
                'Selamat Datang Kembali 👋',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
            ),
            const SizedBox(height: 6),
            AnimatedEntrance(
              delay: const Duration(milliseconds: 220),
              child: const Text(
                'Masuk untuk melanjutkan daftar tontonan favoritmu.',
                style: TextStyle(color: AppColors.textMuted, fontSize: 13),
              ),
            ),
            const SizedBox(height: 28),
            AnimatedEntrance(
              delay: const Duration(milliseconds: 280),
              child: _buildModernField(
                label: 'Email / Nama Pengguna',
                controller: _emailController,
                hint: 'nama@email.com',
                icon: Icons.alternate_email_rounded,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!val.contains('@')) return 'Format email tidak valid';
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),
            AnimatedEntrance(
              delay: const Duration(milliseconds: 340),
              child: _buildModernField(
                label: 'Kata Sandi',
                controller: _passwordController,
                hint: 'Minimal 6 karakter',
                icon: Icons.lock_outline_rounded,
                obscure: _obscurePassword,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Kata sandi tidak boleh kosong';
                  }
                  if (val.length < 6) return 'Kata sandi minimal 6 karakter';
                  return null;
                },
                suffix: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.textMuted,
                    size: 20,
                  ),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                  tooltip: _obscurePassword
                      ? 'Tampilkan sandi'
                      : 'Sembunyikan sandi',
                ),
              ),
            ),
            const SizedBox(height: 14),
            AnimatedEntrance(
              delay: const Duration(milliseconds: 400),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Checkbox(
                          value: _rememberMe,
                          activeColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          onChanged: (v) =>
                              setState(() => _rememberMe = v ?? false),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text('Ingat saya',
                          style: TextStyle(
                              color: AppColors.textMuted, fontSize: 13)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lupa Sandi?',
                      style: TextStyle(
                        color: AppColors.primaryAccent,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            AnimatedEntrance(
              delay: const Duration(milliseconds: 460),
              child: GradientButton(
                label: 'Masuk Sekarang',
                loading: _loading,
                gradient: AppColors.buttonGradient,
                onPressed: _handleLogin,
              ),
            ),
            const SizedBox(height: 24),
            AnimatedEntrance(
              delay: const Duration(milliseconds: 520),
              child: Row(
                children: [
                  Expanded(
                      child: Divider(color: Colors.white.withOpacity(0.1))),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('atau masuk dengan',
                        style: TextStyle(
                            color: AppColors.textMuted, fontSize: 12)),
                  ),
                  Expanded(
                      child: Divider(color: Colors.white.withOpacity(0.1))),
                ],
              ),
            ),
            const SizedBox(height: 18),
            AnimatedEntrance(
              delay: const Duration(milliseconds: 580),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SocialIconButton(
                      icon: Icons.g_mobiledata_rounded,
                      color: Color(0xFFEA4335)),
                  SizedBox(width: 16),
                  SocialIconButton(
                      icon: Icons.apple_rounded, color: Colors.white),
                  SizedBox(width: 16),
                  SocialIconButton(
                      icon: Icons.facebook_rounded, color: Color(0xFF1877F2)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernField({
    required String label,
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
    Widget? suffix,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textMain,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          validator: validator,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.inputBg,
            hintText: hint,
            hintStyle:
                TextStyle(color: Colors.white.withOpacity(0.28), fontSize: 14),
            prefixIcon: Icon(icon, size: 20, color: AppColors.textMuted),
            suffixIcon: suffix,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.08)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.08)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.primary, width: 1.8),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.primaryAccent),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVisualPanel({bool compact = false}) {
    return ClipRRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ScaleTransition(
            scale: _pulseAnimation,
            child: Image.asset(
              'assets/images/Login.jpg',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Container(color: AppColors.surfaceCard),
            ),
          ),
          Container(
              decoration:
                  const BoxDecoration(gradient: AppColors.bannerGradient)),
          if (!compact)
            Positioned(
              left: 40,
              right: 40,
              bottom: 48,
              child: AnimatedEntrance(
                delay: const Duration(milliseconds: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: AppColors.primaryAccent.withOpacity(0.4)),
                      ),
                      child: const Text(
                        '✨ Musim Baru Rilis',
                        style: TextStyle(
                          color: AppColors.primaryAccent,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Tonton Ratusan Judul Anime Terbaik.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
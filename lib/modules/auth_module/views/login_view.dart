import 'package:flutter/material.dart';
import '../../../common/app_text_styles.dart';
import '../widgets/animated_blob_background.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/gradient_button.dart';
import '../widgets/social_login_row.dart';
import '../widgets/staggered_fade_slide.dart';
import 'signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late final AnimationController _entranceController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLoginTap() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _isLoading = false);
  }

  void _goToSignUp() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, animation, _) => const SignUpView(),
        transitionsBuilder: (_, animation, _, child) {
          final slide =
              Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              );
          return SlideTransition(position: slide, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: const Color(
                0xFF09090B,
              ), // Deep elegant zinc dark base fallback
              child: const AnimatedBlobBackground(),
            ),
          ),

          Positioned.fill(
            child: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight:
                            constraints.maxHeight -
                            64, // Subtracts explicit padding offset
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StaggeredFadeSlide(
                              controller: _entranceController,
                              interval: const Interval(
                                0.0,
                                0.6,
                                curve: Curves.easeOut,
                              ),
                              child: const AuthHeader(
                                title: 'Welcome back',
                                subtitle:
                                    'Log in to continue where you left off.',
                              ),
                            ),
                            const SizedBox(height: 40),
                            StaggeredFadeSlide(
                              controller: _entranceController,
                              interval: const Interval(
                                0.15,
                                0.75,
                                curve: Curves.easeOut,
                              ),
                              child: AuthTextField(
                                label: 'Email',
                                hint: 'you@example.com',
                                controller: _emailController,
                                prefixIcon: Icons.email_outlined,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) =>
                                    (value == null || !value.contains('@'))
                                    ? 'Enter a valid email'
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 18),
                            StaggeredFadeSlide(
                              controller: _entranceController,
                              interval: const Interval(
                                0.25,
                                0.85,
                                curve: Curves.easeOut,
                              ),
                              child: AuthTextField(
                                label: 'Password',
                                hint: '••••••••',
                                controller: _passwordController,
                                prefixIcon: Icons.lock_outline_rounded,
                                isPassword: true,
                                textInputAction: TextInputAction.done,
                                validator: (value) =>
                                    (value == null || value.length < 6)
                                    ? 'At least 6 characters'
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 12),
                            StaggeredFadeSlide(
                              controller: _entranceController,
                              interval: const Interval(
                                0.3,
                                0.9,
                                curve: Curves.easeOut,
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Text(
                                    'Forgot password?',
                                    style: AppTextStyles.linkText,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            StaggeredFadeSlide(
                              controller: _entranceController,
                              interval: const Interval(
                                0.35,
                                0.95,
                                curve: Curves.easeOut,
                              ),
                              child: GradientButton(
                                label: 'Log In',
                                isLoading: _isLoading,
                                onPressed: _handleLoginTap,
                              ),
                            ),
                            const SizedBox(height: 32),
                            StaggeredFadeSlide(
                              controller: _entranceController,
                              interval: const Interval(
                                0.4,
                                1.0,
                                curve: Curves.easeOut,
                              ),
                              child: SocialLoginRow(
                                onGoogleTap: () {},
                                onAppleTap: () {},
                                onFacebookTap: () {},
                              ),
                            ),
                            const SizedBox(height: 32),
                            StaggeredFadeSlide(
                              controller: _entranceController,
                              interval: const Interval(
                                0.45,
                                1.0,
                                curve: Curves.easeOut,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Don't have an account? ",
                                      style: AppTextStyles.caption.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: _goToSignUp,
                                      child: Text(
                                        'Sign Up',
                                        style: AppTextStyles.linkText,
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
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

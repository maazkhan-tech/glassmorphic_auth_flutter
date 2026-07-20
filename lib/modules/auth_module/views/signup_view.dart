import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../common/app_text_styles.dart';
import '../widgets/animated_blob_background.dart';
import '../widgets/animated_checkbox_row.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/gradient_button.dart';
import '../widgets/social_login_row.dart';
import '../widgets/staggered_fade_slide.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  late final AnimationController _entranceController;
  bool _isLoading = false;
  bool _agreedToTerms = false;

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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUpTap() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (!_agreedToTerms) return; // in a real app, show a snackbar here
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // demo only
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
      context.goNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const Positioned.fill(child: AnimatedBlobBackground()),
          SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 36), // room for the back button
                        StaggeredFadeSlide(
                          controller: _entranceController,
                          interval: const Interval(
                            0.0,
                            0.6,
                            curve: Curves.easeOut,
                          ),
                          child: const AuthHeader(
                            title: 'Create account',
                            subtitle: 'Sign up in seconds and get started.',
                          ),
                        ),
                        const SizedBox(height: 36),
                        StaggeredFadeSlide(
                          controller: _entranceController,
                          interval: const Interval(
                            0.12,
                            0.7,
                            curve: Curves.easeOut,
                          ),
                          child: AuthTextField(
                            label: 'Full name',
                            hint: 'John Doe',
                            controller: _nameController,
                            prefixIcon: Icons.person_outline_rounded,
                            validator: (value) =>
                                (value == null || value.trim().length < 2)
                                ? 'Enter your name'
                                : null,
                          ),
                        ),
                        const SizedBox(height: 18),
                        StaggeredFadeSlide(
                          controller: _entranceController,
                          interval: const Interval(
                            0.2,
                            0.78,
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
                            0.28,
                            0.86,
                            curve: Curves.easeOut,
                          ),
                          child: AuthTextField(
                            label: 'Password',
                            hint: '••••••••',
                            controller: _passwordController,
                            prefixIcon: Icons.lock_outline_rounded,
                            isPassword: true,
                            validator: (value) =>
                                (value == null || value.length < 6)
                                ? 'At least 6 characters'
                                : null,
                          ),
                        ),
                        const SizedBox(height: 18),
                        StaggeredFadeSlide(
                          controller: _entranceController,
                          interval: const Interval(
                            0.34,
                            0.92,
                            curve: Curves.easeOut,
                          ),
                          child: AuthTextField(
                            label: 'Confirm password',
                            hint: '••••••••',
                            controller: _confirmPasswordController,
                            prefixIcon: Icons.lock_outline_rounded,
                            isPassword: true,
                            textInputAction: TextInputAction.done,
                            validator: (value) =>
                                (value != _passwordController.text)
                                ? 'Passwords do not match'
                                : null,
                          ),
                        ),
                        const SizedBox(height: 22),
                        StaggeredFadeSlide(
                          controller: _entranceController,
                          interval: const Interval(
                            0.4,
                            0.96,
                            curve: Curves.easeOut,
                          ),
                          child: AnimatedCheckboxRow(
                            value: _agreedToTerms,
                            onChanged: (value) =>
                                setState(() => _agreedToTerms = value),
                            label: 'I agree to the',
                          ),
                        ),
                        const SizedBox(height: 26),
                        StaggeredFadeSlide(
                          controller: _entranceController,
                          interval: const Interval(
                            0.45,
                            1.0,
                            curve: Curves.easeOut,
                          ),
                          child: GradientButton(
                            label: 'Create Account',
                            isLoading: _isLoading,
                            onPressed: _handleSignUpTap,
                          ),
                        ),
                        const SizedBox(height: 30),
                        StaggeredFadeSlide(
                          controller: _entranceController,
                          interval: const Interval(
                            0.5,
                            1.0,
                            curve: Curves.easeOut,
                          ),
                          child: SocialLoginRow(
                            onGoogleTap: () {},
                            onAppleTap: () {},
                            onFacebookTap: () {},
                          ),
                        ),
                        const SizedBox(height: 30),
                        StaggeredFadeSlide(
                          controller: _entranceController,
                          interval: const Interval(
                            0.55,
                            1.0,
                            curve: Curves.easeOut,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: AppTextStyles.caption.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Text(
                                    'Log In',
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
                Positioned(
                  top: 0,
                  left: 8,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
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

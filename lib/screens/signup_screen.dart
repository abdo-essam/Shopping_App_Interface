import 'package:flutter/material.dart';
import '../animations/fade_page_route.dart';
import '../lang/app_localizations.dart';
import '../utils/dialog_utils.dart';
import '../utils/snackbar_utils.dart';
import '../utils/style_constants.dart';
import '../widgets/signUp/signup_button.dart';
import '../widgets/signUp/signup_form_field.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;


  void _handleSignUp() {
    final localizations = AppLocalizations.of(context);
    if (_formKey.currentState!.validate()) {
      DialogUtils.showSuccessDialog(
        context: context,
        title: localizations.success,
        content: localizations.accountCreated,
        onClose: () {
          Navigator.pushReplacement(
            context,
            FadePageRoute(page: const HomeScreen()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(localizations.createAccount, style: StyleConstants.headlineStyle),
                    const SizedBox(height: 10),
                    Text(
                      localizations.fillForm,
                      style: StyleConstants.subtitleStyle,
                    ),
                    const SizedBox(height: 30),
                    SignUpFormField(
                      controller: _fullNameController,
                      label: localizations.fullName,
                      prefixIcon: Icons.person_outline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        if (value[0] != value[0].toUpperCase()) {
                          SnackBarUtils.showErrorSnackBar(
                            context: context,
                            message: 'First letter must be capitalized',
                          );
                          return 'First letter must be capitalized';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    SignUpFormField(
                      controller: _emailController,
                      label: localizations.email,
                      prefixIcon: Icons.email_outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          SnackBarUtils.showErrorSnackBar(
                            context: context,
                            message: 'Email must contain @',
                          );
                          return 'Email must contain @';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    SignUpFormField(
                      controller: _passwordController,
                      label: localizations.password,
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      isVisible: _isPasswordVisible,
                      onVisibilityToggle: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          SnackBarUtils.showErrorSnackBar(
                            context: context,
                            message: 'Password must be at least 6 characters',
                          );
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    SignUpFormField(
                      controller: _confirmPasswordController,
                      label: localizations.confirmPassword,
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      isVisible: _isConfirmPasswordVisible,
                      onVisibilityToggle: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          SnackBarUtils.showErrorSnackBar(
                            context: context,
                            message: 'Passwords do not match',
                          );
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    SignUpButton(onPressed: _handleSignUp),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../animations/fade_page_route.dart';
import '../lang/app_localizations.dart';
import '../utils/dialog_utils.dart';
import '../utils/snackbar_utils.dart';
import '../utils/style_constants.dart';
import '../widgets/signUp/signup_button.dart';
import '../widgets/signUp/signup_form_field.dart';
import 'home_screen.dart';
import 'login_screen.dart';

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
  bool _isLoading = false;

  Future<void> _handleSignUp() async {
    final localizations = AppLocalizations.of(context);
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Create user with email and password
        final UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Update user profile with full name
        await userCredential.user?.updateDisplayName(_fullNameController.text.trim());

        if (mounted) {
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
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        switch (e.code) {
          case 'weak-password':
            errorMessage = localizations.weakPassword;
            break;
          case 'email-already-in-use':
            errorMessage = localizations.emailAlreadyInUse;
            break;
          case 'invalid-email':
            errorMessage = localizations.invalidEmail;
            break;
          default:
            errorMessage = localizations.signUpError;
        }
        SnackBarUtils.showErrorSnackBar(
          context: context,
          message: errorMessage,
        );
      } catch (e) {
        SnackBarUtils.showErrorSnackBar(
          context: context,
          message: localizations.signUpError,
        );
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
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
                    Text(
                      localizations.createAccount,
                      style: StyleConstants.headlineStyle,
                    ),
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
                          return localizations.enterFullName;
                        }
                        if (value[0] != value[0].toUpperCase()) {
                          SnackBarUtils.showErrorSnackBar(
                            context: context,
                            message: localizations.capitalizeFirst,
                          );
                          return localizations.capitalizeFirst;
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
                          return localizations.enterEmail;
                        }
                        if (!value.contains('@')) {
                          SnackBarUtils.showErrorSnackBar(
                            context: context,
                            message: localizations.emailFormat,
                          );
                          return localizations.emailFormat;
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
                          return localizations.enterPassword;
                        }
                        if (value.length < 6) {
                          SnackBarUtils.showErrorSnackBar(
                            context: context,
                            message: localizations.passwordLength,
                          );
                          return localizations.passwordLength;
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
                          return localizations.confirmYourPassword;
                        }
                        if (value != _passwordController.text) {
                          SnackBarUtils.showErrorSnackBar(
                            context: context,
                            message: localizations.passwordsMatch,
                          );
                          return localizations.passwordsMatch;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                      children: [
                        SignUpButton(
                          onPressed: _handleSignUp,
                          text: localizations.signUp,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              localizations.alreadyHaveAccount,
                              style: StyleConstants.subtitleStyle,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  FadePageRoute(
                                    page: const LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(localizations.login),
                            ),
                          ],
                        ),
                      ],
                    ),
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../animations/fade_page_route.dart';
import '../lang/app_localizations.dart';
import '../utils/dialog_utils.dart';
import '../utils/snackbar_utils.dart';
import '../utils/style_constants.dart';
import '../widgets/signUp/signup_button.dart';
import '../widgets/signUp/signup_form_field.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    final localizations = AppLocalizations.of(context);
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (mounted) {
          DialogUtils.showSuccessDialog(
            context: context,
            title: localizations.success,
            content: localizations.welcomeWithName(
              FirebaseAuth.instance.currentUser?.displayName ?? '',
            ),
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
          case 'user-not-found':
            errorMessage = localizations.invalidEmail;
            break;
          case 'wrong-password':
            errorMessage = localizations.loginError;
            break;
          case 'invalid-email':
            errorMessage = localizations.invalidEmail;
            break;
          case 'user-disabled':
            errorMessage = localizations.authError;
            break;
          default:
            errorMessage = localizations.loginError;
        }
        SnackBarUtils.showErrorSnackBar(
          context: context,
          message: errorMessage,
        );
      } catch (e) {
        SnackBarUtils.showErrorSnackBar(
          context: context,
          message: localizations.networkError,
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

  Future<void> _handleResetPassword() async {
    final localizations = AppLocalizations.of(context);
    if (_emailController.text.isEmpty) {
      SnackBarUtils.showErrorSnackBar(
        context: context,
        message: localizations.enterEmail,
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      if (mounted) {
        SnackBarUtils.showSuccessSnackBar(
          context: context,
          message: localizations.resetPasswordSuccess,
        );
      }
    } catch (e) {
      SnackBarUtils.showErrorSnackBar(
        context: context,
        message: localizations.resetPasswordError,
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
                    Text(
                      localizations.login,
                      style: StyleConstants.headlineStyle,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      localizations.fillForm,
                      style: StyleConstants.subtitleStyle,
                    ),
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _handleResetPassword,
                        child: Text(localizations.resetPassword),
                      ),
                    ),
                    const SizedBox(height: 30),
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                      children: [
                        SignUpButton(
                          onPressed: _handleLogin,
                          text: localizations.login,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              localizations.createAccount,
                              style: StyleConstants.subtitleStyle,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  FadePageRoute(
                                    page: const SignUpScreen(),
                                  ),
                                );
                              },
                              child: Text(localizations.signUp),
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
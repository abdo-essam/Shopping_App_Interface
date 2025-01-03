import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const _localizedValues = {
    'en': {
      'appTitle': 'Shopping App',
      'ourProducts': 'Our Products',
      'hotOffers': 'Hot Offers',
      'addToCart': 'Add to Cart',
      'productAdded': 'Product Added to Cart',
      'createAccount': 'Create Account',
      'fillForm': 'Please fill in the form to continue',
      'fullName': 'Full Name',
      'email': 'Email',
      'password': 'Password',
      'confirmPassword': 'Confirm Password',
      'signUp': 'Sign Up',
      'success': 'Success',
      'accountCreated': 'Account created successfully',
      'close': 'Close',
      'enterFullName': 'Please enter your full name',
      'capitalizeFirst': 'First letter must be capitalized',
      'enterEmail': 'Please enter your email',
      'emailFormat': 'Email must contain @',
      'enterPassword': 'Please enter your password',
      'passwordLength': 'Password must be at least 6 characters',
      'confirmYourPassword': 'Please confirm your password',
      'passwordsMatch': 'Passwords do not match',
      'product': 'Product',
      'hotOffer': 'Hot Offer',
      'alreadyHaveAccount': 'Already have an account?',
      'login': 'Login',
    },
    'ar': {
      'appTitle': 'تطبيق التسوق',
      'ourProducts': 'منتجاتنا',
      'hotOffers': 'عروض حصرية',
      'addToCart': 'أضف إلى السلة',
      'productAdded': 'تمت إضافة المنتج إلى السلة',
      'createAccount': 'إنشاء حساب',
      'fillForm': 'يرجى ملء النموذج للمتابعة',
      'fullName': 'الاسم الكامل',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'confirmPassword': 'تأكيد كلمة المرور',
      'signUp': 'تسجيل',
      'success': 'تم بنجاح',
      'accountCreated': 'تم إنشاء الحساب بنجاح',
      'close': 'إغلاق',
      'enterFullName': 'الرجاء إدخال الاسم الكامل',
      'capitalizeFirst': 'يجب أن يبدأ الاسم بحرف كبير',
      'enterEmail': 'الرجاء إدخال البريد الإلكتروني',
      'emailFormat': 'يجب أن يحتوي البريد الإلكتروني على @',
      'enterPassword': 'الرجاء إدخال كلمة المرور',
      'passwordLength': 'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
      'confirmYourPassword': 'الرجاء تأكيد كلمة المرور',
      'passwordsMatch': 'كلمات المرور غير متطابقة',
      'product': 'منتج',
      'hotOffer': 'عرض حصري',
      'alreadyHaveAccount': 'هل لديك حساب؟',
      'login': 'تسجيل الدخول',
    },
  };

  // Add getters for all translations
  String get appTitle => _localizedValues[locale.languageCode]!['appTitle']!;
  String get ourProducts => _localizedValues[locale.languageCode]!['ourProducts']!;
  String get hotOffers => _localizedValues[locale.languageCode]!['hotOffers']!;
  String get addToCart => _localizedValues[locale.languageCode]!['addToCart']!;
  String get productAdded => _localizedValues[locale.languageCode]!['productAdded']!;
  String get createAccount => _localizedValues[locale.languageCode]!['createAccount']!;
  String get fillForm => _localizedValues[locale.languageCode]!['fillForm']!;
  String get fullName => _localizedValues[locale.languageCode]!['fullName']!;
  String get email => _localizedValues[locale.languageCode]!['email']!;
  String get password => _localizedValues[locale.languageCode]!['password']!;
  String get confirmPassword => _localizedValues[locale.languageCode]!['confirmPassword']!;
  String get signUp => _localizedValues[locale.languageCode]!['signUp']!;
  String get success => _localizedValues[locale.languageCode]!['success']!;
  String get accountCreated => _localizedValues[locale.languageCode]!['accountCreated']!;
  String get close => _localizedValues[locale.languageCode]!['close']!;
  String get enterFullName => _localizedValues[locale.languageCode]!['enterFullName']!;
  String get capitalizeFirst => _localizedValues[locale.languageCode]!['capitalizeFirst']!;
  String get enterEmail => _localizedValues[locale.languageCode]!['enterEmail']!;
  String get emailFormat => _localizedValues[locale.languageCode]!['emailFormat']!;
  String get enterPassword => _localizedValues[locale.languageCode]!['enterPassword']!;
  String get passwordLength => _localizedValues[locale.languageCode]!['passwordLength']!;
  String get confirmYourPassword => _localizedValues[locale.languageCode]!['confirmYourPassword']!;
  String get passwordsMatch => _localizedValues[locale.languageCode]!['passwordsMatch']!;
  String get product => _localizedValues[locale.languageCode]!['product']!;
  String get hotOffer => _localizedValues[locale.languageCode]!['hotOffer']!;
  String get alreadyHaveAccount => _localizedValues[locale.languageCode]!['alreadyHaveAccount']!;
  String get login => _localizedValues[locale.languageCode]!['login']!;

  String productWithNumber(int number) {
    return '${_localizedValues[locale.languageCode]!['product']!} $number';
  }

  String hotOfferWithNumber(int number) {
    return '${_localizedValues[locale.languageCode]!['hotOffer']!} $number';
  }
}
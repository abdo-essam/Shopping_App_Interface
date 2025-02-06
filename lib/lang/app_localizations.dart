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
      'profile': 'Profile',
      'biometricNotAvailable': 'Biometric authentication is not available on this device',
      'authenticationFailed': 'Authentication failed. Please try again',
      // New Firebase-related translations
      'weakPassword': 'The password provided is too weak',
      'emailAlreadyInUse': 'An account already exists for that email',
      'invalidEmail': 'Please enter a valid email address',
      'signUpError': 'An error occurred during sign up',
      'networkError': 'Network error occurred. Please check your connection',
      'authError': 'Authentication error occurred',
      'loading': 'Loading...',
      'retry': 'Retry',
      'cancel': 'Cancel',
      'signOut': 'Sign Out',
      'welcome': 'Welcome',
      'loginError': 'Login failed. Please check your credentials',
      'resetPassword': 'Reset Password',
      'resetPasswordSuccess': 'Password reset email has been sent',
      'resetPasswordError': 'Failed to send password reset email',
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
      'profile': 'الملف الشخصي',
      'biometricNotAvailable': 'المصادقة البيومترية غير متوفرة على هذا الجهاز',
      'authenticationFailed': 'فشلت المصادقة. حاول مرة أخرى',
      // New Firebase-related translations in Arabic
      'weakPassword': 'كلمة المرور ضعيفة جداً',
      'emailAlreadyInUse': 'البريد الإلكتروني مستخدم بالفعل',
      'invalidEmail': 'البريد الإلكتروني غير صالح',
      'signUpError': 'حدث خطأ أثناء التسجيل',
      'networkError': 'حدث خطأ في الشبكة. يرجى التحقق من اتصالك',
      'authError': 'حدث خطأ في المصادقة',
      'loading': 'جاري التحميل...',
      'retry': 'إعادة المحاولة',
      'cancel': 'إلغاء',
      'signOut': 'تسجيل الخروج',
      'welcome': 'مرحباً',
      'loginError': 'فشل تسجيل الدخول. يرجى التحقق من بيانات الاعتماد',
      'resetPassword': 'إعادة تعيين كلمة المرور',
      'resetPasswordSuccess': 'تم إرسال رابط إعادة تعيين كلمة المرور',
      'resetPasswordError': 'فشل إرسال رابط إعادة تعيين كلمة المرور',
    },
  };

  String get biometricNotAvailable => _localizedValues[locale.languageCode]!['biometricNotAvailable']!;
  String get authenticationFailed => _localizedValues[locale.languageCode]!['authenticationFailed']!;
  // Existing getters
  String get appTitle => _localizedValues[locale.languageCode]!['appTitle']!;

  String get ourProducts =>
      _localizedValues[locale.languageCode]!['ourProducts']!;

  String get hotOffers => _localizedValues[locale.languageCode]!['hotOffers']!;

  String get addToCart => _localizedValues[locale.languageCode]!['addToCart']!;

  String get productAdded =>
      _localizedValues[locale.languageCode]!['productAdded']!;

  String get createAccount =>
      _localizedValues[locale.languageCode]!['createAccount']!;

  String get fillForm => _localizedValues[locale.languageCode]!['fillForm']!;

  String get fullName => _localizedValues[locale.languageCode]!['fullName']!;

  String get email => _localizedValues[locale.languageCode]!['email']!;

  String get password => _localizedValues[locale.languageCode]!['password']!;

  String get confirmPassword =>
      _localizedValues[locale.languageCode]!['confirmPassword']!;

  String get signUp => _localizedValues[locale.languageCode]!['signUp']!;

  String get success => _localizedValues[locale.languageCode]!['success']!;

  String get accountCreated =>
      _localizedValues[locale.languageCode]!['accountCreated']!;

  String get close => _localizedValues[locale.languageCode]!['close']!;

  String get enterFullName =>
      _localizedValues[locale.languageCode]!['enterFullName']!;

  String get capitalizeFirst =>
      _localizedValues[locale.languageCode]!['capitalizeFirst']!;

  String get enterEmail =>
      _localizedValues[locale.languageCode]!['enterEmail']!;

  String get emailFormat =>
      _localizedValues[locale.languageCode]!['emailFormat']!;

  String get enterPassword =>
      _localizedValues[locale.languageCode]!['enterPassword']!;

  String get passwordLength =>
      _localizedValues[locale.languageCode]!['passwordLength']!;

  String get confirmYourPassword =>
      _localizedValues[locale.languageCode]!['confirmYourPassword']!;

  String get passwordsMatch =>
      _localizedValues[locale.languageCode]!['passwordsMatch']!;

  String get product => _localizedValues[locale.languageCode]!['product']!;

  String get hotOffer => _localizedValues[locale.languageCode]!['hotOffer']!;

  String get alreadyHaveAccount =>
      _localizedValues[locale.languageCode]!['alreadyHaveAccount']!;

  String get login => _localizedValues[locale.languageCode]!['login']!;

  String get profile => _localizedValues[locale.languageCode]!['profile']!;

  // New Firebase-related getters
  String get weakPassword =>
      _localizedValues[locale.languageCode]!['weakPassword']!;

  String get emailAlreadyInUse =>
      _localizedValues[locale.languageCode]!['emailAlreadyInUse']!;

  String get invalidEmail =>
      _localizedValues[locale.languageCode]!['invalidEmail']!;

  String get signUpError =>
      _localizedValues[locale.languageCode]!['signUpError']!;

  String get networkError =>
      _localizedValues[locale.languageCode]!['networkError']!;

  String get authError => _localizedValues[locale.languageCode]!['authError']!;

  String get loading => _localizedValues[locale.languageCode]!['loading']!;

  String get retry => _localizedValues[locale.languageCode]!['retry']!;

  String get cancel => _localizedValues[locale.languageCode]!['cancel']!;

  String get signOut => _localizedValues[locale.languageCode]!['signOut']!;

  String get welcome => _localizedValues[locale.languageCode]!['welcome']!;

  String get loginError =>
      _localizedValues[locale.languageCode]!['loginError']!;

  String get resetPassword =>
      _localizedValues[locale.languageCode]!['resetPassword']!;

  String get resetPasswordSuccess =>
      _localizedValues[locale.languageCode]!['resetPasswordSuccess']!;

  String get resetPasswordError =>
      _localizedValues[locale.languageCode]!['resetPasswordError']!;

  // Existing helper methods
  String productWithNumber(int number) {
    return '${_localizedValues[locale.languageCode]!['product']!} $number';
  }

  String hotOfferWithNumber(int number) {
    return '${_localizedValues[locale.languageCode]!['hotOffer']!} $number';
  }

  // New helper method for welcome message with name
  String welcomeWithName(String name) {
    return '${_localizedValues[locale.languageCode]!['welcome']!}, $name';
  }
}

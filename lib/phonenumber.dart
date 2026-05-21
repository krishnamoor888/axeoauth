import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_screen.dart';
import 'verify_otp_page.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  static const _brandGreen = Color(0xFF2E9738);
  static const _accentOrange = Color(0xFFF58220);

  static const _logoWidth = 100.0;
  static const _basketContentW = 94.0;
  static const _basketContentH = 83.0;
  static const _basketFileW = 152.0;

  final TextEditingController _phoneController = TextEditingController();
  bool _isSendingOtp = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  String? _validatePhone(String raw) {
    final digits = raw.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 10) {
      return 'Enter a valid 10 digit mobile number';
    }
    if (digits.startsWith('0')) {
      return 'Mobile number cannot start with 0';
    }
    return null;
  }

  /// E.164 for Firebase, e.g. +911234567890 (matches +91 1234 567 890 in console).
  static String toE164India(String tenDigits) => '+91$tenDigits';

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _onContinue() async {
    final raw = _phoneController.text.trim();
    final validationError = _validatePhone(raw);
    if (validationError != null) {
      _showMessage(validationError);
      return;
    }

    final digits = raw.replaceAll(RegExp(r'\D'), '');
    final e164 = toE164India(digits);

    setState(() => _isSendingOtp = true);

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: e164,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        try {
          await FirebaseAuth.instance.signInWithCredential(credential);
          if (!mounted) return;
          navigateToHome(context);
        } on FirebaseAuthException catch (e) {
          if (mounted) {
            _showMessage(e.message ?? 'Auto verification failed');
          }
        } finally {
          if (mounted) setState(() => _isSendingOtp = false);
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        if (!mounted) return;
        setState(() => _isSendingOtp = false);
        final hint =
            e.code == 'invalid-phone-number'
                ? ' Use the exact test number from Firebase (e.g. 1234567890).'
                : '';
        _showMessage('${e.message ?? e.code}$hint');
      },
      codeSent: (String verificationId, int? resendToken) {
        if (!mounted) return;
        setState(() => _isSendingOtp = false);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (_) => VerifyOtpPage(
                  phoneNumber: e164,
                  verificationId: verificationId,
                  resendToken: resendToken,
                ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (_) {
        if (mounted) setState(() => _isSendingOtp = false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: _brandGreen,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _BasketLogo(
                            width: _logoWidth,
                            fileWidth:
                                _logoWidth * _basketFileW / _basketContentW,
                            height:
                                _logoWidth * _basketContentH / _basketContentW,
                          ),
                          const SizedBox(height: 16),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                height: 1.25,
                              ),
                              children: [
                                TextSpan(
                                  text: "India's First Multiple\n",
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextSpan(
                                  text: 'Super Market app',
                                  style: TextStyle(color: _accentOrange),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "India's First Multi-Supermarket App\nShop from all nearby stores in one cart",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Welcome Back, ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'ShopsyGo Mart',
                                    style: TextStyle(color: _brandGreen),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Please enter your Mobile Number details to access your account.',
                              style: TextStyle(
                                color: Colors.black.withValues(alpha: 0.65),
                                fontSize: 15,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'Mobile Number',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              enabled: !_isSendingOtp,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: InputDecoration(
                                prefixText: '+91 ',
                                prefixStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                                hintText: 'Enter Mobile Number',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: _brandGreen,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 55,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _brandGreen,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 0,
                              ),
                              onPressed: _isSendingOtp ? null : _onContinue,
                              child:
                                  _isSendingOtp
                                      ? const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                      : const Text(
                                        'Continue',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Center(
                            child: Text(
                              'Terms & Conditions',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// basket.png with oval shadow, matching the login screen mockup.
class _BasketLogo extends StatelessWidget {
  const _BasketLogo({
    required this.width,
    required this.fileWidth,
    required this.height,
  });

  final double width;
  final double fileWidth;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height + 14,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: width * 0.55,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.22),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: ClipRect(
              child: SizedBox(
                width: width,
                height: height,
                child: OverflowBox(
                  alignment: Alignment.center,
                  maxWidth: fileWidth,
                  child: Image.asset(
                    'assets/images/basket.png',
                    width: fileWidth,
                    fit: BoxFit.fitWidth,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

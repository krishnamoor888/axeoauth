import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const _topColor = Color(0xFF021B45);
  static const _bottomColor = Color(0xFF238B34);

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

    Future.delayed(const Duration(seconds: 3), _goToHome);
  }

  void _goToHome() {
    if (!mounted) return;

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const IntroScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_topColor, _bottomColor],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(child: CustomPaint(painter: _SplashArcPainter())),

            /// LOGO
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/basket.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.contain,
                ),

                // const SizedBox(height: 8),
                Image.asset(
                  'assets/images/basket_text.png',
                  width: 50,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SplashArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2
          ..strokeCap = StrokeCap.round
          ..color = Colors.white.withOpacity(0.07);

    /// EXACT STYLE RINGS
    final radiuses = [55.0, 75.0, 95.0, 115.0, 135.0, 155.0];

    for (int i = 0; i < radiuses.length; i++) {
      final rect = Rect.fromCircle(center: center, radius: radiuses[i]);

      canvas.drawArc(rect, math.pi * 0.15, math.pi * 1.45, false, paint);
    }

    /// OUTER BIG ARC
    final outerPaint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round
          ..color = Colors.white.withOpacity(0.08);

    final outerRect = Rect.fromCircle(center: center, radius: 175);

    canvas.drawArc(outerRect, math.pi * 0.35, math.pi * 1.1, false, outerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

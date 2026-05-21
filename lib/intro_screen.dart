import 'package:flutter/material.dart';

import 'phonenumber.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static const _brandGreen = Color(0xFF2E9738);
  static const _pageCount = 3;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const _pages = <_IntroPageData>[
    _IntroPageData(
      image: 'assets/images/items.png',
      title: 'Get Favorite Items',
      subtitle:
          'Select your location to see the wide range stores and order your desired item',
    ),
    _IntroPageData(
      image: 'assets/images/phone.png',
      title: 'Search Nearby Super Market',
      subtitle:
          'Find the nearest supermarket instantly and shop smarter',
    ),
    _IntroPageData(
      image: 'assets/images/payment.png',
      title: 'Easy Payment Options',
      subtitle:
          'Order item with COD payment or Pay by safer and faster payment Gateway',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPhoneScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const PhoneNumberPage()),
    );
  }

  void _onNext() {
    if (_currentPage < _pageCount - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }
    _goToPhoneScreen();
  }

  void _onSkip() => _goToPhoneScreen();

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pageCount,
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return _IntroPageContent(
                    image: page.image,
                    title: page.title,
                    subtitle: page.subtitle,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PageIndicator(
                    count: _pageCount,
                    activeIndex: _currentPage,
                    activeColor: _brandGreen,
                  ),
                  const SizedBox(height: 28),
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
                      onPressed: _onNext,
                      child: Text(
                        _currentPage == _pageCount - 1 ? 'Get Started' : 'Next',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 55,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _brandGreen,
                        side: const BorderSide(color: _brandGreen, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: _onSkip,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroPageData {
  const _IntroPageData({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;
}

class _IntroPageContent extends StatelessWidget {
  const _IntroPageContent({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final imageMaxHeight = constraints.maxHeight * 0.48;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              SizedBox(
                height: imageMaxHeight,
                width: double.infinity,
                child: Center(
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black.withValues(alpha: 0.72),
                  height: 1.45,
                ),
              ),
              const Spacer(flex: 3),
            ],
          );
        },
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    required this.count,
    required this.activeIndex,
    required this.activeColor,
  });

  final int count;
  final int activeIndex;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: isActive ? 30 : 20,
          decoration: BoxDecoration(
            color: isActive ? activeColor : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:event_hub/features/onboarding/presentation/models/onboarding_data.dart';
import 'package:event_hub/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:event_hub/features/onboarding/presentation/widgets/onboarding_bottom_sheet.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'Explore Upcoming and\nNearby Events',
      description:
          'In publishing and graphic design, Lorem is\na placeholder text commonly',
      imagePath: 'assets/images/onboarding-one.png',
    ),
    OnboardingData(
      title: 'Web Have Modern\nEvents Calendar',
      description:
          'In publishing and graphic design, Lorem is\na placeholder text commonly',
      imagePath: 'assets/images/onboarding-two.png',
    ),
    OnboardingData(
      title: 'To Look Up More\nEvents or Activities',
      description:
          'In publishing and graphic design, Lorem is\na placeholder text commonly',
      imagePath: 'assets/images/onboarding-three.png',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/signin');
    }
  }

  void _onSkip() {
    Navigator.pushReplacementNamed(context, '/signin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemCount: _pages.length,
            itemBuilder: (_, i) => OnboardingPage(data: _pages[i]),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: OnboardingBottomSheet(
              currentPage: _currentPage,
              totalPages: _pages.length,
              title: _pages[_currentPage].title,
              description: _pages[_currentPage].description,
              onSkip: _onSkip,
              onNext: _onNext,
            ),
          ),
        ],
      ),
    );
  }
}

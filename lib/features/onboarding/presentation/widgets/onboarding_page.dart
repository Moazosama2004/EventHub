import 'package:flutter/material.dart';
import 'package:event_hub/features/onboarding/presentation/models/onboarding_data.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({required this.data});
  final OnboardingData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F7FF),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Image.asset(data.imagePath, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 280),
        ],
      ),
    );
  }
}

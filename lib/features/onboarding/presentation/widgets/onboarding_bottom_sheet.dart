import 'package:flutter/material.dart';

class OnboardingBottomSheet extends StatelessWidget {
  const OnboardingBottomSheet({
    required this.currentPage,
    required this.totalPages,
    required this.title,
    required this.description,
    required this.onSkip,
    required this.onNext,
  });

  final int currentPage;
  final int totalPages;
  final String title;
  final String description;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: const BoxDecoration(
        color: Color(0xFF6C63FF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(28, 32, 28, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              title,
              key: ValueKey(title),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.4,
              ),
            ),
          ),

          const SizedBox(height: 12),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              description,
              key: ValueKey(description),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withOpacity(0.75),
                height: 1.6,
              ),
            ),
          ),

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Skip
              GestureDetector(
                onTap: onSkip,
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ),

              Row(
                children: List.generate(
                  totalPages,
                  (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: i == currentPage ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == currentPage
                          ? Colors.white
                          : Colors.white.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: onNext,
                child: Text(
                  currentPage == totalPages - 1 ? 'Start' : 'Next',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

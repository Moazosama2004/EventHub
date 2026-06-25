import 'package:flutter/material.dart';

class EventHubButton extends StatelessWidget {
  const EventHubButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  static const _gradient = LinearGradient(
    colors: [Color(0xFF7B6EF6), Color(0xFF6C63FF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const _arrowCircleColor = Color(0xFF5A52D5);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          gradient: _gradient,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.only(left: 24, right: 8),
        child: Row(
          children: [
            Expanded(
              child: isLoading
                  ? const Center(
                      child: SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      ),
                    )
                  : Text(
                      text.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
            ),
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: _arrowCircleColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

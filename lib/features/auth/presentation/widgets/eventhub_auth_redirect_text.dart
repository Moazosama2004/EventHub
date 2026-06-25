import 'package:flutter/material.dart';

class EventHubAuthRedirectText extends StatelessWidget {
  const EventHubAuthRedirectText({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onTap,
  });

  final String questionText;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF1A1A2E),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF6C63FF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

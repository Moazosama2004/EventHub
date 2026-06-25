import 'package:flutter/material.dart';

class InterestTag {
  final String label;
  final Color color;
  const InterestTag({required this.label, required this.color});
}

class InterestChip extends StatelessWidget {
  const InterestChip({super.key, required this.tag});
  final InterestTag tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: tag.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        tag.label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

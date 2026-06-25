import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.onSeeAll,
  });

  final String title;
  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A2E),
            ),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: const Row(
              children: [
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6C63FF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 11,
                  color: Color(0xFF6C63FF),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

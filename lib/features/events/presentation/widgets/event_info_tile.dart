import 'package:flutter/material.dart';

class EventInfoTile extends StatelessWidget {
  const EventInfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconBgColor = const Color(0xFFEEF0FF),
    this.iconColor = const Color(0xFF6C63FF),
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconBgColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ── Icon box ───────────────────────────────
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),

        const SizedBox(width: 14),

        // ── Text ───────────────────────────────────
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF9E9E9E),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

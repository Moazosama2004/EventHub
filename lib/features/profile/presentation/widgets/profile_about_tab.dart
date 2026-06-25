import 'package:flutter/material.dart';

class ProfileAboutTab extends StatefulWidget {
  const ProfileAboutTab({super.key, required this.about});
  final String about;

  @override
  State<ProfileAboutTab> createState() => _ProfileAboutTabState();
}

class _ProfileAboutTabState extends State<ProfileAboutTab> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final shortText = widget.about.length > 120
        ? widget.about.substring(0, 120)
        : widget.about;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _isExpanded ? widget.about : '$shortText...',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6E6E6E),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Text(
              _isExpanded ? 'Show Less' : 'Read More',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6C63FF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

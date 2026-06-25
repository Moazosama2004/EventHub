import 'package:flutter/material.dart';

class InviteBanner extends StatelessWidget {
  const InviteBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Invite your friends',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Get \$20 for ticket',
                  style: TextStyle(fontSize: 13, color: Color(0xFF6E6E6E)),
                ),
                const SizedBox(height: 14),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF34AADC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'INVITE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.network(
            'https://picsum.photos/seed/gift/120/100',
            width: 110,
            height: 90,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

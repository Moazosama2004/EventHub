import 'package:flutter/material.dart';

class EventGoingBar extends StatelessWidget {
  const EventGoingBar({
    super.key,
    required this.goingCount,
    required this.attendeeAvatars,
    required this.onInvite,
  });

  final String goingCount;
  final List<String> attendeeAvatars;
  final VoidCallback onInvite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Stacked avatars ───────────────────────
          SizedBox(
            width: 20.0 + (attendeeAvatars.length - 1) * 18.0,
            height: 36,
            child: Stack(
              children: List.generate(
                attendeeAvatars.length,
                (i) => Positioned(
                  left: i * 18.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(attendeeAvatars[i]),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // ── Going count ───────────────────────────
          Text(
            goingCount,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6C63FF),
            ),
          ),

          const Spacer(),

          // ── Invite button ─────────────────────────
          GestureDetector(
            onTap: onInvite,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7B6EF6), Color(0xFF6C63FF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Invite',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

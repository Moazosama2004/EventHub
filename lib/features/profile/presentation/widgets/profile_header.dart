import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.avatarUrl,
    required this.following,
    required this.followers,
    required this.onFollow,
    required this.onMessage,
    required this.onBack,
    required this.onMore,
  });

  final String name;
  final String avatarUrl;
  final String following;
  final String followers;
  final VoidCallback onFollow;
  final VoidCallback onMessage;
  final VoidCallback onBack;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── App bar ──────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onBack,
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Color(0xFF1A1A2E),
                  size: 24,
                ),
              ),
              GestureDetector(
                onTap: onMore,
                child: const Icon(
                  Icons.more_vert_rounded,
                  color: Color(0xFF1A1A2E),
                  size: 24,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // ── Avatar ───────────────────────────────────
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(avatarUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 14),

        // ── Name ─────────────────────────────────────
        Text(
          name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1A1A2E),
          ),
        ),

        const SizedBox(height: 14),

        // ── Following | Followers ────────────────────
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _StatItem(count: following, label: 'Following'),
            Container(
              height: 36,
              width: 1,
              color: const Color(0xFFE0E0E0),
              margin: const EdgeInsets.symmetric(horizontal: 24),
            ),
            _StatItem(count: followers, label: 'Followers'),
          ],
        ),

        const SizedBox(height: 20),

        // ── Follow + Message buttons ─────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              // Follow
              Expanded(
                child: GestureDetector(
                  onTap: onFollow,
                  child: Container(
                    height: 46,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7B6EF6), Color(0xFF6C63FF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Message
              Expanded(
                child: GestureDetector(
                  onTap: onMessage,
                  child: Container(
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF6C63FF),
                        width: 1.5,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline_rounded,
                          color: Color(0xFF6C63FF),
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Massages',
                          style: TextStyle(
                            color: Color(0xFF6C63FF),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.count, required this.label});
  final String count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF9E9E9E),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

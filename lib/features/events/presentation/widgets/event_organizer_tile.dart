import 'package:flutter/material.dart';
import '../../../profile/presentation/pages/user_profile_screen.dart';
import '../../../profile/presentation/widgets/profile_event_tab.dart';
import '../../../profile/presentation/widgets/profile_reviews_tab.dart';

class EventOrganizerTile extends StatelessWidget {
  const EventOrganizerTile({
    super.key,
    required this.name,
    required this.role,
    required this.avatarUrl,
    required this.onFollow,
    this.isFollowing = false,
    // ── Optional profile data ─────────────────────
    this.following = '0',
    this.followers = '0',
    this.about = '',
    this.organizerEvents = const [],
    this.organizerReviews = const [],
  });

  final String name;
  final String role;
  final String avatarUrl;
  final VoidCallback onFollow;
  final bool isFollowing;

  // ── Profile screen data ───────────────────────────
  final String following;
  final String followers;
  final String about;
  final List<ProfileEventModel> organizerEvents;
  final List<ReviewModel> organizerReviews;

  void _navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => UserProfileScreen(
          name: name,
          avatarUrl: avatarUrl,
          following: following,
          followers: followers,
          about: about,
          events: organizerEvents,
          reviews: organizerReviews,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToProfile(context),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F7FF),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            // ── Avatar ───────────────────────────────
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(avatarUrl),
            ),

            const SizedBox(width: 14),

            // ── Name + role ──────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    role,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                ],
              ),
            ),

            // ── Follow button ────────────────────────
            GestureDetector(
              // Stop tap from bubbling up to the row GestureDetector
              onTap: () {
                onFollow();
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF0FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isFollowing ? 'Following' : 'Follow',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isFollowing
                        ? const Color(0xFF9E9E9E)
                        : const Color(0xFF6C63FF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

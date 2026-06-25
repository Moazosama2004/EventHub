import 'package:flutter/material.dart';
import '../../../events/presentation/pages/event_detail_screen.dart';

class ProfileEventModel {
  final String imageUrl;
  final String date;
  final String title;
  // detail screen fields
  final String time;
  final String venueName;
  final String venueAddress;
  final String organizerName;
  final String organizerAvatarUrl;
  final String about;
  final String price;
  final String goingCount;
  final List<String> attendeeAvatars;

  const ProfileEventModel({
    required this.imageUrl,
    required this.date,
    required this.title,
    required this.time,
    required this.venueName,
    required this.venueAddress,
    required this.organizerName,
    required this.organizerAvatarUrl,
    required this.about,
    required this.price,
    required this.goingCount,
    required this.attendeeAvatars,
  });
}

class ProfileEventTab extends StatelessWidget {
  const ProfileEventTab({super.key, required this.events});
  final List<ProfileEventModel> events;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: events.length,
      itemBuilder: (_, i) => _ProfileEventItem(event: events[i]),
    );
  }
}

class _ProfileEventItem extends StatelessWidget {
  const _ProfileEventItem({required this.event});
  final ProfileEventModel event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => EventDetailScreen(
            imageUrl: event.imageUrl,
            title: event.title,
            date: event.date,
            time: event.time,
            venueName: event.venueName,
            venueAddress: event.venueAddress,
            organizerName: event.organizerName,
            organizerAvatarUrl: event.organizerAvatarUrl,
            about: event.about,
            price: event.price,
            goingCount: event.goingCount,
            attendeeAvatars: event.attendeeAvatars,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // ── Thumbnail ────────────────────────────
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                event.imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            // ── Info ─────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.date,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6C63FF),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: Color(0xFFBDBDBD),
            ),
          ],
        ),
      ),
    );
  }
}

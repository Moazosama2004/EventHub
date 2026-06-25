import 'package:flutter/material.dart';

class NearbyEventModel {
  final String date, title, imageUrl;
  const NearbyEventModel({
    required this.date,
    required this.title,
    required this.imageUrl,
  });
}

class NearbyEventCard extends StatelessWidget {
  const NearbyEventCard({super.key, required this.event});
  final NearbyEventModel event;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Thumbnail ──────────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              event.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // ── Info ───────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.date,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9E9E9E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // ── Bookmark ───────────────────────────────
          const Icon(
            Icons.bookmark_outline_rounded,
            color: Color(0xFF9E9E9E),
            size: 20,
          ),
        ],
      ),
    );
  }
}

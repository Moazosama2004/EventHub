import 'package:flutter/material.dart';

class EventDetailHeader extends StatelessWidget {
  const EventDetailHeader({
    super.key,
    required this.imageUrl,
    required this.onBack,
    required this.onBookmark,
    this.isBookmarked = false,
  });

  final String imageUrl;
  final VoidCallback onBack;
  final VoidCallback onBookmark;
  final bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Stack(
        children: [
          // ── Hero image ─────────────────────────────
          Positioned.fill(
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),

          // ── Dark gradient overlay ───────────────────
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.45),
                    Colors.black.withOpacity(0.1),
                  ],
                ),
              ),
            ),
          ),

          // ── Top bar ────────────────────────────────
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button
                GestureDetector(
                  onTap: onBack,
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),

                const Text(
                  'Event Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),

                // Bookmark button
                GestureDetector(
                  onTap: onBookmark,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      isBookmarked
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_outline_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

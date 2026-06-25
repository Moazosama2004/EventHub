import 'package:flutter/material.dart';

class ReviewModel {
  final String name;
  final String avatarUrl;
  final String date;
  final int rating;
  final String comment;

  const ReviewModel({
    required this.name,
    required this.avatarUrl,
    required this.date,
    required this.rating,
    required this.comment,
  });
}

class ProfileReviewsTab extends StatelessWidget {
  const ProfileReviewsTab({super.key, required this.reviews});
  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: reviews.length,
      itemBuilder: (_, i) => _ReviewItem(review: reviews[i]),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem({required this.review});
  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Avatar ───────────────────────────────
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(review.avatarUrl),
          ),

          const SizedBox(width: 12),

          // ── Content ──────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    Text(
                      review.date,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // Stars
                Row(
                  children: List.generate(
                    5,
                    (i) => Icon(
                      Icons.star_rounded,
                      size: 16,
                      color: i < review.rating
                          ? const Color(0xFFFFCC00)
                          : const Color(0xFFE0E0E0),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                // Comment
                Text(
                  review.comment,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6E6E6E),
                    height: 1.5,
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

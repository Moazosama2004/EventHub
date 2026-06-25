import 'package:event_hub/features/profile/presentation/widgets/profile_event_tab.dart';
import 'package:event_hub/features/profile/presentation/widgets/profile_reviews_tab.dart';
import 'package:flutter/material.dart';
import '../../../events/presentation/pages/event_detail_screen.dart';

class EventModel {
  final String day, month, title, going, location, imageUrl;
  final Color color;

  // ── Detail screen fields ──────────────────────────
  final String date;
  final String time;
  final String venueName;
  final String venueAddress;
  final String organizerName;
  final String organizerAvatarUrl;
  final String about;
  final String price;
  final List<String> attendeeAvatars;

  const EventModel({
    required this.day,
    required this.month,
    required this.title,
    required this.going,
    required this.location,
    required this.color,
    required this.imageUrl,
    // detail fields
    required this.date,
    required this.time,
    required this.venueName,
    required this.venueAddress,
    required this.organizerName,
    required this.organizerAvatarUrl,
    required this.about,
    required this.price,
    required this.attendeeAvatars,
  });
}

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});
  final EventModel event;

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EventDetailScreen(
          imageUrl: 'https://picsum.photos/seed/concert/600/400',
          title: 'International Band Music Concert',
          date: '14 December, 2021',
          time: 'Tuesday, 4:00PM - 9:00PM',
          venueName: 'Gala Convention Center',
          venueAddress: '36 Guild Street London, UK',
          organizerName: 'David Silbia',
          organizerAvatarUrl:
              'https://randomuser.me/api/portraits/men/32.jpg',
          about:
              'Enjoy your favorite dishe and a lovely your '
              'friends and family and have a great time.',
          price: '120',
          goingCount: '+20 Going',
          attendeeAvatars: [
            'https://randomuser.me/api/portraits/men/1.jpg',
            'https://randomuser.me/api/portraits/women/1.jpg',
            'https://randomuser.me/api/portraits/men/2.jpg',
          ],

          // ── Organizer profile data ──────────────────
          organizerFollowing: '350',
          organizerFollowers: '346',
          organizerAbout:
              'Enjoy your favorite dishe and a lovely your '
              'friends and family and have a great time. '
              'Food from local food trucks will be available.',
          organizerEvents: [
            ProfileEventModel(
              imageUrl: 'https://picsum.photos/seed/jazz/200/200',
              date: '1ST MAY · SAT · 2:00 PM',
              title: 'A virtual evening of smooth jazz',
              time: 'Saturday, 2:00PM - 6:00PM',
              venueName: 'Lot 13',
              venueAddress: 'Lot 13 · Oakland, CA',
              organizerName: 'David Silbia',
              organizerAvatarUrl:
                  'https://randomuser.me/api/portraits/men/32.jpg',
              about: 'A wonderful evening of smooth jazz.',
              price: '50',
              goingCount: '+20 Going',
              attendeeAvatars: [
                'https://randomuser.me/api/portraits/men/1.jpg',
                'https://randomuser.me/api/portraits/women/1.jpg',
              ],
            ),
          ],
          organizerReviews: [
            ReviewModel(
              name: 'Rocks Velkeinjen',
              avatarUrl: 'https://randomuser.me/api/portraits/men/10.jpg',
              date: '10 Feb',
              rating: 4,
              comment:
                  'Cinemas is the ultimate experience to see new '
                  'movies in Gold Class or Vmax.',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetail(context),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    event.imageUrl,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    color: event.color.withOpacity(0.3),
                    colorBlendMode: BlendMode.srcATop,
                  ),
                ),

                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          event.day,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF6C63FF),
                          ),
                        ),
                        Text(
                          event.month,
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF9E9E9E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Bookmark ────────────────────────
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.bookmark_outline_rounded,
                      size: 16,
                      color: Color(0xFFFF6B6B),
                    ),
                  ),
                ),
              ],
            ),

            // ── Info ─────────────────────────────────
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // ── Avatars + Going ─────────────
                  Row(
                    children: [
                      SizedBox(
                        width: 44,
                        height: 22,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(
                                  event.attendeeAvatars.isNotEmpty
                                      ? event.attendeeAvatars[0]
                                      : 'https://randomuser.me/api/portraits/men/1.jpg',
                                ),
                              ),
                            ),
                            Positioned(
                              left: 14,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(
                                  event.attendeeAvatars.length > 1
                                      ? event.attendeeAvatars[1]
                                      : 'https://randomuser.me/api/portraits/women/1.jpg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        event.going,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6C63FF),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // ── Location ────────────────────
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: Color(0xFF9E9E9E),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          event.location,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF9E9E9E),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

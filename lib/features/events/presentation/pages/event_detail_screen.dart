import 'package:event_hub/features/events/presentation/widgets/event_detail_header.dart';
import 'package:event_hub/features/profile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

// ── Add these fields to EventDetailScreen ────────────────
class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.time,
    required this.venueName,
    required this.venueAddress,
    required this.organizerName,
    required this.organizerAvatarUrl,
    required this.about,
    required this.price,
    required this.goingCount,
    required this.attendeeAvatars,
    // ── New organizer profile fields ──────────────
    this.organizerFollowing = '0',
    this.organizerFollowers = '0',
    this.organizerAbout = '',
    this.organizerEvents = const [],
    this.organizerReviews = const [],
  });

  // existing fields...
  final String imageUrl;
  final String title;
  final String date;
  final String time;
  final String venueName;
  final String venueAddress;
  final String organizerName;
  final String organizerAvatarUrl;
  final String about;
  final String price;
  final String goingCount;
  final List<String> attendeeAvatars;

  // ── Organizer profile fields ──────────────────────
  final String organizerFollowing;
  final String organizerFollowers;
  final String organizerAbout;
  final List<ProfileEventModel> organizerEvents;
  final List<ReviewModel> organizerReviews;

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  bool _isBookmarked = false;
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ── Scrollable content ──────────────────────
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Header image ──────────────────────
                EventDetailHeader(
                  imageUrl: widget.imageUrl,
                  isBookmarked: _isBookmarked,
                  onBack: () => Navigator.pop(context),
                  onBookmark: () =>
                      setState(() => _isBookmarked = !_isBookmarked),
                ),

                // ── Going bar (overlaps header) ────────
                Transform.translate(
                  offset: const Offset(0, -24),
                  child: EventGoingBar(
                    goingCount: widget.goingCount,
                    attendeeAvatars: widget.attendeeAvatars,
                    onInvite: () {},
                  ),
                ),

                // ── Title ─────────────────────────────
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A1A2E),
                      height: 1.2,
                    ),
                  ),
                ),
                // ── Date info tile ─────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: EventInfoTile(
                    icon: Icons.calendar_month_outlined,
                    title: widget.date,
                    subtitle: widget.time,
                    iconBgColor: const Color(0xFFEEF0FF),
                    iconColor: const Color(0xFF6C63FF),
                  ),
                ),
                const SizedBox(height: 16),
                // ── Location info tile ─────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: EventInfoTile(
                    icon: Icons.location_on_outlined,
                    title: widget.venueName,
                    subtitle: widget.venueAddress,
                    iconBgColor: const Color(0xFFEEF0FF),
                    iconColor: const Color(0xFF6C63FF),
                  ),
                ),
                const SizedBox(height: 16),
                // ── Organizer ──────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: EventOrganizerTile(
                    name: widget.organizerName,
                    role: 'Organizer',
                    avatarUrl: widget.organizerAvatarUrl,
                    isFollowing: _isFollowing,
                    following: widget.organizerFollowing,
                    followers: widget.organizerFollowers,
                    about: widget.organizerAbout,
                    organizerEvents: widget.organizerEvents,
                    organizerReviews: widget.organizerReviews,
                    onFollow: () =>
                        setState(() => _isFollowing = !_isFollowing),
                  ),
                ),

                const SizedBox(height: 24),

                // ── About event ────────────────────────
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'About Event',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.about,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6E6E6E),
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Buy ticket button (pinned bottom) ────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7B6EF6), Color(0xFF6C63FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.only(left: 24, right: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'BUY TICKET \$${widget.price}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF5A52D5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

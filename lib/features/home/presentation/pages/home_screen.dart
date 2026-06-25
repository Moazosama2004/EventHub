import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _selectedCategory = 0;

  final List<EventCategory> _categories = [
    EventCategory(
      label: 'Sports',
      color: Color(0xFFFF6B6B),
      icon: Icons.sports_basketball_rounded,
    ),
    EventCategory(
      label: 'Music',
      color: Color(0xFFFF9500),
      icon: Icons.music_note_rounded,
    ),
    EventCategory(
      label: 'Food',
      color: Color(0xFF4CD964),
      icon: Icons.restaurant_rounded,
    ),
    EventCategory(
      label: 'Art',
      color: Color(0xFF6C63FF),
      icon: Icons.palette_rounded,
    ),
  ];

  final List<EventModel> _upcomingEvents = [
    EventModel(
      // ── Card fields ──────────────────────────────
      day: '10',
      month: 'JUNE',
      title: 'International Band Music Concert',
      going: '+20 Going',
      location: '36 Guild Street London, UK',
      color: Color(0xFFFFF0F0),
      imageUrl: 'https://picsum.photos/seed/concert/300/200',

      // ── Detail fields ─────────────────────────────
      date: '14 December, 2021',
      time: 'Tuesday, 4:00PM - 9:00PM',
      venueName: 'Gala Convention Center',
      venueAddress: '36 Guild Street London, UK',
      organizerName: 'Ashfak Sayem',
      organizerAvatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
      about:
          'Enjoy your favorite dishe and a lovely your friends '
          'and family and have a great time. Food from local '
          'food trucks will be available for purchase.',
      price: '120',
      attendeeAvatars: [
        'https://randomuser.me/api/portraits/men/1.jpg',
        'https://randomuser.me/api/portraits/women/1.jpg',
        'https://randomuser.me/api/portraits/men/2.jpg',
      ],
    ),
    EventModel(
      day: '10',
      month: 'JUNE',
      title: 'Jo Malone London Event',
      going: '+15 Going',
      location: 'Radius Gallery, London',
      color: Color(0xFFE8F4FF),
      imageUrl: 'https://picsum.photos/seed/event2/300/200',

      date: '10 June, 2021',
      time: 'Saturday, 2:00PM - 6:00PM',
      venueName: 'Radius Gallery',
      venueAddress: 'Radius Gallery, Santa Cruz, CA',
      organizerName: 'Jo Malone',
      organizerAvatarUrl:
          'https://randomuser.me/api/portraits/women/32.jpg',
      about:
          'A wonderful event celebrating the finest fragrances '
          'and luxury lifestyle experiences.',
      price: '80',
      attendeeAvatars: [
        'https://randomuser.me/api/portraits/women/2.jpg',
        'https://randomuser.me/api/portraits/men/3.jpg',
        'https://randomuser.me/api/portraits/women/3.jpg',
      ],
    ),
  ];

  final List<NearbyEventModel> _nearbyEvents = [
    NearbyEventModel(
      date: '10 June · 8:00 PM',
      title: 'International Gala Music Festival',
      imageUrl: 'https://picsum.photos/seed/nearby1/100/100',
    ),
    NearbyEventModel(
      date: '15 June · 6:00 PM',
      title: 'Summer Art Exhibition',
      imageUrl: 'https://picsum.photos/seed/nearby2/100/100',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: Column(
        children: [
          const HomeHeader(),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  CategoryRow(
                    categories: _categories,
                    selected: _selectedCategory,
                    onSelect: (i) => setState(() => _selectedCategory = i),
                  ),

                  const SizedBox(height: 24),

                  SectionHeader(title: 'Upcoming Events', onSeeAll: () {}),

                  const SizedBox(height: 14),

                  SizedBox(
                    height: 260,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: _upcomingEvents.length,
                      separatorBuilder: (_, _) =>
                          const SizedBox(width: 16),
                      itemBuilder: (_, i) =>
                          EventCard(event: _upcomingEvents[i]),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const InviteBanner(),

                  const SizedBox(height: 24),

                  SectionHeader(title: 'Nearby You', onSeeAll: () {}),

                  const SizedBox(height: 14),

                  ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _nearbyEvents.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (_, i) =>
                        NearbyEventCard(event: _nearbyEvents[i]),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),

      // ── Bottom nav ───────────────────────────────────
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() => _currentIndex = i);

          // Reset back to Explore (0) after returning
          // from pushed screens so tab stays in sync
          if (i == 1 || i == 3) {
            Future.delayed(Duration.zero, () {
              setState(() => _currentIndex = 0);
            });
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF6C63FF),
        elevation: 4,
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 28,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
    );
  }
}

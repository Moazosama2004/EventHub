import 'package:event_hub/core/constants/routes.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../../../search/presentation/widgets/widgets.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  int _selectedTab = 0;

  final List<Map<String, String>> _upcomingEvents = [
    {
      'imageUrl': 'https://picsum.photos/seed/mother/200/200',
      'date': 'Wed, Apr 28 • 5:30 PM',
      'title': "Jo Malone London's Mother's Day Presents",
      'location': 'Radius Gallery • Santa Cruz, CA',
    },
    {
      'imageUrl': 'https://picsum.photos/seed/jazz/200/200',
      'date': 'Sat, May 1 • 2:00 PM',
      'title': 'A Virtual Evening of Smooth Jazz',
      'location': 'Lot 13 • Oakland, CA',
    },
    {
      'imageUrl': 'https://picsum.photos/seed/women/200/200',
      'date': 'Sat, Apr 24 • 1:30 PM',
      'title': "Women's Leadership Conference 2021",
      'location': '53 Bush St • San Francisco, CA',
    },
    {
      'imageUrl': 'https://picsum.photos/seed/kids/200/200',
      'date': 'Fri, Apr 23 • 6:00 PM',
      'title': 'International Kids Safe Parents Night Out',
      'location': 'Lot 13 • Oakland, CA',
    },
    {
      'imageUrl': 'https://picsum.photos/seed/jimi/200/200',
      'date': 'Mon, Jun 21 • 10:00 PM',
      'title': 'Collectivity Plays the Music of Jimi',
      'location': 'Longboard Margarita Bar',
    },
    {
      'imageUrl': 'https://picsum.photos/seed/gala/200/200',
      'date': 'Sun, Apr 25 • 10:15 AM',
      'title': 'International Gala Music Festival',
      'location': '36 Guild Street London, UK',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = _selectedTab == 1;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // ── App bar ──────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xFF1A1A2E),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Events',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ),

                  // Search icon (only on list view)
                  if (!isEmpty)
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(
                        Icons.search_rounded,
                        color: Color(0xFF1A1A2E),
                        size: 22,
                      ),
                    ),

                  const Icon(
                    Icons.more_vert_rounded,
                    color: Color(0xFF1A1A2E),
                    size: 22,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Tab bar ──────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: EventsTabBar(
                selectedIndex: _selectedTab,
                onTabChanged: (i) => setState(() => _selectedTab = i),
              ),
            ),

            const SizedBox(height: 8),

            // ── Body ─────────────────────────────────
            Expanded(
              child: isEmpty
                  // ── Empty state ────────────────────
                  ? Center(
                      child: EmptyEventsView(
                        title: 'No Upcoming Event',
                        subtitle:
                            'Lorem ipsum dolor sit amet,\nconsectetur',
                        onExplore: () =>
                            Navigator.pushNamed(context, Routes.events),
                      ),
                    )
                  // ── Events list ────────────────────
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 8, bottom: 24),
                      itemCount: _upcomingEvents.length,
                      itemBuilder: (_, i) => EventListItem(
                        imageUrl: _upcomingEvents[i]['imageUrl']!,
                        date: _upcomingEvents[i]['date']!,
                        title: _upcomingEvents[i]['title']!,
                        location: _upcomingEvents[i]['location'],
                        onTap: () {},
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  final List<Map<String, String>> _events = [
    {
      'imageUrl': 'https://picsum.photos/seed/jazz/200/200',
      'date': '1ST MAY · SAT · 2:00 PM',
      'title': 'A virtual evening of smooth jazz',
    },
    {
      'imageUrl': 'https://picsum.photos/seed/mother/200/200',
      'date': '1ST MAY · SAT · 2:00 PM',
      'title': "Jo malone london's mother's day",
    },
    {
      'imageUrl': 'https://picsum.photos/seed/women/200/200',
      'date': '1ST MAY · SAT · 2:00 PM',
      'title': "Women's leadership conference",
    },
    {
      'imageUrl': 'https://picsum.photos/seed/kids/200/200',
      'date': '1ST MAY · SAT · 2:00 PM',
      'title': 'International kids safe parents night out',
    },
    {
      'imageUrl': 'https://picsum.photos/seed/gala/200/200',
      'date': '1ST MAY · SAT · 2:00 PM',
      'title': 'International gala music festival',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // ── App bar ────────────────────────────────
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
                  const Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Search bar ─────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Search input
                  Expanded(
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search_rounded,
                            color: Color(0xFF9E9E9E),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1A1A2E),
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Search...',
                                hintStyle: TextStyle(
                                  color: Color(0xFFBDBDBD),
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Filters button
                  Container(
                    height: 46,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6C63FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.tune_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Filters',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ── Results list ───────────────────────────
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 4, bottom: 24),
                itemCount: _events.length,
                itemBuilder: (_, i) => EventListItem(
                  imageUrl: _events[i]['imageUrl']!,
                  date: _events[i]['date']!,
                  title: _events[i]['title']!,
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

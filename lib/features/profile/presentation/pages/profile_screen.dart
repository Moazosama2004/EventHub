import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isExpanded = false;

  final String _aboutText =
      'Enjoy your favorite dishe and a lovely your friends and family and have a great time. '
      'Food from local food trucks will be available for purchase.';

  final List<InterestTag> _interests = [
    InterestTag(label: 'Games Online', color: Color(0xFF6C63FF)),
    InterestTag(label: 'Concert', color: Color(0xFFFF6B6B)),
    InterestTag(label: 'Music', color: Color(0xFFFF9500)),
    InterestTag(label: 'Art', color: Color(0xFF4CD964)),
    InterestTag(label: 'Movie', color: Color(0xFF34AADC)),
    InterestTag(label: 'Others', color: Color(0xFF9B59B6)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xFF1A1A2E),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              Center(
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://randomuser.me/api/portraits/men/32.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      'Ashfak Sayem',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StatItem(count: '350', label: 'Following'),
                        Container(
                          height: 36,
                          width: 1,
                          color: const Color(0xFFE0E0E0),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                        ),
                        StatItem(count: '346', label: 'Followers'),
                      ],
                    ),

                    const SizedBox(height: 20),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: const Color(0xFF6C63FF),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.edit_outlined,
                              color: Color(0xFF6C63FF),
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF6C63FF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // ── About Me ───────────────────────────────
              const Text(
                'About Me',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A2E),
                ),
              ),

              const SizedBox(height: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _isExpanded
                        ? _aboutText
                        : '${_aboutText.substring(0, 100)}...',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6E6E6E),
                      height: 1.6,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        setState(() => _isExpanded = !_isExpanded),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _isExpanded ? 'Show Less' : 'Read More',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6C63FF),
                          ),
                        ),
                        Icon(
                          _isExpanded
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: const Color(0xFF6C63FF),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Interest',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0EEFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.edit_outlined,
                            size: 13,
                            color: Color(0xFF6C63FF),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'CHANGE',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF6C63FF),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _interests
                    .map((tag) => InterestChip(tag: tag))
                    .toList(),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

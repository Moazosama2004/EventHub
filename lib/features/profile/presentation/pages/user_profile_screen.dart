import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({
    super.key,
    required this.name,
    required this.avatarUrl,
    required this.following,
    required this.followers,
    required this.about,
    required this.events,
    required this.reviews,
  });

  final String name;
  final String avatarUrl;
  final String following;
  final String followers;
  final String about;
  final List<ProfileEventModel> events;
  final List<ReviewModel> reviews;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isFollowing = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (_, __) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // ── Header ──────────────────────────
                  ProfileHeader(
                    name: widget.name,
                    avatarUrl: widget.avatarUrl,
                    following: widget.following,
                    followers: widget.followers,
                    onBack: () => Navigator.pop(context),
                    onMore: () {},
                    onFollow: () =>
                        setState(() => _isFollowing = !_isFollowing),
                    onMessage: () {},
                  ),

                  // ── Tab bar ─────────────────────────
                  Container(
                    color: const Color(0xFFF8F7FF),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: const Color(0xFF6C63FF),
                      unselectedLabelColor: const Color(0xFF9E9E9E),
                      labelStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      indicatorColor: const Color(0xFF6C63FF),
                      indicatorWeight: 2.5,
                      tabs: const [
                        Tab(text: 'ABOUT'),
                        Tab(text: 'EVENT'),
                        Tab(text: 'REVIEWS'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

          body: TabBarView(
            controller: _tabController,
            children: [
              // ── About tab ─────────────────────────
              SingleChildScrollView(
                child: ProfileAboutTab(about: widget.about),
              ),

              // ── Event tab ─────────────────────────
              SingleChildScrollView(
                child: ProfileEventTab(events: widget.events),
              ),

              // ── Reviews tab ───────────────────────
              SingleChildScrollView(
                child: ProfileReviewsTab(reviews: widget.reviews),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

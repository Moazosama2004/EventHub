import 'package:flutter/material.dart';
import '../../../events/presentation/pages/events_screen.dart';
import '../../../profile/presentation/pages/profile_screen.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  void _handleNavigation(BuildContext context, int index) {
    // Update selected index
    onTap(index);

    // Navigate to screen
    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EventsScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
        break;
      default:
        // index 0 (Explore) and 2 (Map) — handle later
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.white,
      elevation: 12,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.explore_rounded,
              label: 'Explore',
              index: 0,
              current: currentIndex,
              onTap: (i) => _handleNavigation(context, i),
            ),
            _NavItem(
              icon: Icons.event_rounded,
              label: 'Events',
              index: 1,
              current: currentIndex,
              onTap: (i) => _handleNavigation(context, i),
            ),
            const SizedBox(width: 40),
            _NavItem(
              icon: Icons.map_outlined,
              label: 'Map',
              index: 2,
              current: currentIndex,
              onTap: (i) => _handleNavigation(context, i),
            ),
            _NavItem(
              icon: Icons.person_outline_rounded,
              label: 'Profile',
              index: 3,
              current: currentIndex,
              onTap: (i) => _handleNavigation(context, i),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.current,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final int index, current;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = index == current;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? const Color(0xFF6C63FF)
                : const Color(0xFFBDBDBD),
            size: 24,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? const Color(0xFF6C63FF)
                  : const Color(0xFFBDBDBD),
            ),
          ),
        ],
      ),
    );
  }
}

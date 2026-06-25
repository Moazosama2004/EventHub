import 'package:flutter/material.dart';

class EventsTabBar extends StatelessWidget {
  const EventsTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  static const _tabs = ['UPCOMING', 'PAST EVENTS'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(22),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: List.generate(
          _tabs.length,
          (i) => Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  color: selectedIndex == i
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: selectedIndex == i
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  _tabs[i],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                    color: selectedIndex == i
                        ? const Color(0xFF1A1A2E)
                        : const Color(0xFF9E9E9E),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

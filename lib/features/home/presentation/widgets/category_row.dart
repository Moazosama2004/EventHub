import 'package:flutter/material.dart';

class EventCategory {
  final String label;
  final Color color;
  final IconData icon;
  const EventCategory({
    required this.label,
    required this.color,
    required this.icon,
  });
}

class CategoryRow extends StatelessWidget {
  const CategoryRow({
    super.key,
    required this.categories,
    required this.selected,
    required this.onSelect,
  });

  final List<EventCategory> categories;
  final int selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final cat = categories[i];
          final isSelected = i == selected;
          return GestureDetector(
            onTap: () => onSelect(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? cat.color
                    : cat.color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  Icon(
                    cat.icon,
                    color: isSelected ? Colors.white : cat.color,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    cat.label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : cat.color,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

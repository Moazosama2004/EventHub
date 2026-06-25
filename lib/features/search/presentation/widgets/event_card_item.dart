import 'package:flutter/material.dart';

class EventCardItem extends StatelessWidget {
  const EventCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
            child: Image.asset(
              'assets/images/event_image.png',
              width: 79,
              height: 92,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 18),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 14, bottom: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Wed, Apr 28 • 5:30 PM"),
                  SizedBox(height: 4),
                  const Text(
                    "Jo Malone London’s Mother’s Day Presents",
                    maxLines: 2,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_city, size: 16),
                      Expanded(
                        child: const Text(
                          "Radius Gallery • Santa Cruz, CAasdasdasdasd",
                          maxLines: 1,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

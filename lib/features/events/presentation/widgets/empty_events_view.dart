import 'package:flutter/material.dart';

class EmptyEventsView extends StatelessWidget {
  const EmptyEventsView({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onExplore,
  });

  final String title;
  final String subtitle;
  final VoidCallback onExplore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ── Illustration circle ────────────────────
          Container(
            width: 180,
            height: 180,
            decoration: const BoxDecoration(
              color: Color(0xFFEEF0FF),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SizedBox(
                width: 120,
                height: 120,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // ── Calendar ─────────────────────
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 12,
                      bottom: 12,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Red header
                            Container(
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF3B30),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [_Pin(), _Pin()],
                              ),
                            ),

                            // Grid dots
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: GridView.count(
                                  crossAxisCount: 4,
                                  physics:
                                      const NeverScrollableScrollPhysics(),
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  children: List.generate(
                                    12,
                                    (_) => Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF3A3A8C),
                                        borderRadius:
                                            BorderRadius.circular(3),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ── Clock ─────────────────────────
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF4A90D9),
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.access_time_rounded,
                          color: Color(0xFFFFCC00),
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 36),

          // ── Title ──────────────────────────────────
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A2E),
            ),
          ),

          const SizedBox(height: 10),

          // ── Subtitle ───────────────────────────────
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF9E9E9E),
              height: 1.5,
            ),
          ),

          const SizedBox(height: 48),

          // ── Explore button ─────────────────────────
          GestureDetector(
            onTap: onExplore,
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
                  const Expanded(
                    child: Text(
                      'EXPLORE EVENTS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
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
        ],
      ),
    );
  }
}

class _Pin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 14,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SocialProvider { google, facebook }

class EventHubSocialButton extends StatelessWidget {
  const EventHubSocialButton({
    super.key,
    required this.provider,
    required this.onPressed,
    this.isLoading = false,
  });

  final SocialProvider provider;
  final VoidCallback onPressed;
  final bool isLoading;

  String get _label => switch (provider) {
    SocialProvider.google => 'Login with Google',
    SocialProvider.facebook => 'Login with Facebook',
  };

  String get _iconPath => switch (provider) {
    SocialProvider.google => 'assets/images/google-icon.svg',
    SocialProvider.facebook => 'assets/images/facebook-icon.svg',
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 28,
              height: 28,
              child: isLoading
                  ? const CircularProgressIndicator(strokeWidth: 2.5)
                  : SvgPicture.asset(_iconPath, width: 28, height: 28),
            ),
            const SizedBox(width: 14),
            Text(
              _label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A2E),
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

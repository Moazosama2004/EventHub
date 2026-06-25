import 'package:event_hub/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/widgets.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignin() {
    if (_formKey.currentState!.validate()) {
      // Handle sign-in logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 36),

                // ── Logo + App name ──────────────────────
                Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/auth-logo.svg',
                        width: 58,
                        height: 58,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'EventHub',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 36),

                // ── Title ────────────────────────────────
                const Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A1A2E),
                  ),
                ),

                const SizedBox(height: 24),

                // ── Email ────────────────────────────────
                EventHubTextField(
                  hintText: 'abc@email.com',
                  prefixIcon: Icons.mail_outline_rounded,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) =>
                      v!.contains('@') ? null : 'Enter a valid email',
                ),

                const SizedBox(height: 16),

                // ── Password ─────────────────────────────
                EventHubTextField(
                  hintText: 'Your password',
                  prefixIcon: Icons.lock_outline_rounded,
                  isPassword: true,
                  controller: _passwordController,
                  validator: (v) =>
                      v!.length >= 6 ? null : 'Min 6 characters',
                ),

                const SizedBox(height: 12),

                // ── Remember me + Forgot password ────────
                Row(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          setState(() => _rememberMe = !_rememberMe),
                      child: Row(
                        children: [
                          Switch(
                            value: _rememberMe,
                            onChanged: (v) =>
                                setState(() => _rememberMe = v),
                            activeThumbColor: const Color(0xFF6C63FF),
                            activeTrackColor: const Color(
                              0xFF6C63FF,
                            ).withOpacity(0.3),
                          ),
                          const Text(
                            'Remember Me',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF1A1A2E),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF1A1A2E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ── Sign in button ───────────────────────
                EventHubButton(text: 'Sign In', onPressed: _handleSignin),

                const SizedBox(height: 28),

                // ── OR divider ───────────────────────────
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Color(0xFFE0E0E0),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Color(0xFFE0E0E0),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ── Google ───────────────────────────────
                EventHubSocialButton(
                  provider: SocialProvider.google,
                  onPressed: () {},
                ),

                const SizedBox(height: 16),

                // ── Facebook ─────────────────────────────
                EventHubSocialButton(
                  provider: SocialProvider.facebook,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.home);
                  },
                ),

                const SizedBox(height: 28),

                // ── Redirect to signup ───────────────────
                Center(
                  child: EventHubAuthRedirectText(
                    questionText: "Don't have an account?",
                    actionText: 'Sign up',
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.signup),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

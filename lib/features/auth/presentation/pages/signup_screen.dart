import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    if (_formKey.currentState!.validate()) {
      // Handle signup logic
      Navigator.pushNamed(context, '/home');
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
                const SizedBox(height: 16),

                // ── Back button ──────────────────────────
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xFF1A1A2E),
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // ── Title ────────────────────────────────
                const Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A1A2E),
                  ),
                ),

                const SizedBox(height: 28),

                // ── Full name ────────────────────────────
                EventHubTextField(
                  hintText: 'Full name',
                  prefixIcon: Icons.person_outline_rounded,
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  validator: (v) =>
                      v!.trim().isEmpty ? 'Enter your full name' : null,
                ),

                const SizedBox(height: 16),

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

                const SizedBox(height: 16),

                // ── Confirm password ─────────────────────
                EventHubTextField(
                  hintText: 'Confirm password',
                  prefixIcon: Icons.lock_outline_rounded,
                  isPassword: true,
                  controller: _confirmPasswordController,
                  validator: (v) => v == _passwordController.text
                      ? null
                      : 'Passwords do not match',
                ),

                const SizedBox(height: 32),

                // ── Sign up button ───────────────────────
                EventHubButton(text: 'Sign Up', onPressed: _handleSignup),

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
                  onPressed: () {},
                ),

                const SizedBox(height: 28),

                // ── Redirect to login ────────────────────
                Center(
                  child: EventHubAuthRedirectText(
                    questionText: 'Already have an account?',
                    actionText: 'Sign in',
                    onTap: () => Navigator.pop(context),
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

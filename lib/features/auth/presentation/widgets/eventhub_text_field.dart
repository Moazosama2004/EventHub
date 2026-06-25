import 'package:flutter/material.dart';

class EventHubTextField extends StatefulWidget {
  const EventHubTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.keyboardType,
    this.controller,
    this.validator,
    this.onChanged,
  });

  final String? hintText;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  State<EventHubTextField> createState() => _EventHubTextFieldState();
}

class _EventHubTextFieldState extends State<EventHubTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && _obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      style: const TextStyle(fontSize: 16, color: Color(0xFF9E9E9E)),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color(0xFFBDBDBD), fontSize: 16),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: const Color(0xFFBDBDBD),
                size: 22,
              )
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color(0xFFBDBDBD),
                  size: 22,
                ),
                onPressed: () =>
                    setState(() => _obscureText = !_obscureText),
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFFEEEEEE),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFFEEEEEE),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFF9E9E9E),
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

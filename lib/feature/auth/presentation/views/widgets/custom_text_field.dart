import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({
    super.key,
    required this.hint,
    this.onChanged,
    required this.icon,
    this.obscureText = false,
    this.maxLength = false,
    this.onTapSuffixIcon,
    this.maxlength = 11,
  });
  final String hint;
  final int maxlength;
  final Function(String)? onChanged;
  final IconData icon;
  final bool obscureText;
  final bool maxLength;
  final void Function()? onTapSuffixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        maxLength: maxLength ? maxlength : null,
        obscureText: obscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return "Field is required";
          }
          return null;
        },
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        onChanged: onChanged,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          counterStyle: TextStyle(color: Colors.white),
          suffixIcon: GestureDetector(
            onTap: onTapSuffixIcon,
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          iconColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

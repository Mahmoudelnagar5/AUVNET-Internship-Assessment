import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.hintText,
    this.obscureText = false,
    this.onIconPressed,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.autofillHints,
    this.controller,
    this.validator,
  });
  final String? hintText;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onIconPressed;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofillHints: autofillHints,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please fill all fields';
        }
        return null;
      },
      onSaved: onSaved,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hoverColor: Color.fromARGB(255, 242, 241, 241),
        fillColor: Color.fromARGB(255, 242, 241, 241),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          onPressed: onIconPressed,
          color: Colors.grey,
          icon: Icon(
            suffixIcon,
            size: 18.sp,
            color: Colors.grey,
          ),
        ),
        prefixIcon: IconButton(
          onPressed: onIconPressed,
          color: Colors.grey,
          icon: Icon(
            prefixIcon,
            size: 18.sp,
            color: Colors.grey,
          ),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.mulish(
          color: Colors.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 242, 241, 241),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 242, 241, 241),
          ),
        ),
      ),
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(360.w, 50.h),
          backgroundColor: Color(0xff8900FE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.dmSans(
            fontSize: 15.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/services/hive_service.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = HiveService.getUser();
    return Container(
      height: 180.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff8900FE),
            Color(0xFFFFDE59),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 23.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Delivering to",
                    style: GoogleFonts.dmSans(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  FittedBox(
                    child: Text(
                      "Al Satwa, 81A Street",
                      style: GoogleFonts.dmSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  FittedBox(
                    child: Text(
                      user?.name == null || user!.name.isEmpty
                          ? 'Hi Heba!'
                          : 'Hi ${user.name}!',
                      style: GoogleFonts.rubik(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CircleAvatar(
                radius: 35.r,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 35.r,
                  backgroundImage: const AssetImage("assets/photo.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

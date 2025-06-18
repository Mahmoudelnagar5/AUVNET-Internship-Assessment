import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_app_bar.dart';
import 'get_code.dart';
import 'offer_widget.dart';
import 'popular_list.dart';
import 'services_items.dart';
import 'shortcuts.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Services:',
                style: GoogleFonts.dmSans(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ServicesItems(),
            // SizedBox(height: 10.h),
            GetCode(),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Shortcuts:',
                style: GoogleFonts.dmSans(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ShortcutsItems(),
            SizedBox(height: 10.h),
            OfferWidget(),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Popular restaurants nearby',
                style: GoogleFonts.dmSans(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            PopularList(),
          ],
        ),
      ),
    );
  }
}

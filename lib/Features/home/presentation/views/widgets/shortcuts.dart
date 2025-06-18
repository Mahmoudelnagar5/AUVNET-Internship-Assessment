import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/shortcut_model.dart';

class ShortcutsItems extends StatelessWidget {
  const ShortcutsItems({super.key});

  @override
  Widget build(BuildContext context) {
    final shortcuts = ShortcutModel.shortcuts;
    return GridView.builder(
      shrinkWrap: true,
      itemCount: shortcuts.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.50,
      ),
      itemBuilder: (context, index) {
        final service = shortcuts[index];
        return Column(
          children: [
            Container(
              width: 65.w,
              height: 65.h,
              decoration: BoxDecoration(
                color: const Color(0xFFFFEEE6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SvgPicture.asset(
                  service.icon,
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              service.label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.dmSans(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}

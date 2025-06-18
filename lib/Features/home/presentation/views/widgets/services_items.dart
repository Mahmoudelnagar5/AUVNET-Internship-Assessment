import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/service_model.dart';

class ServicesItems extends StatelessWidget {
  const ServicesItems({super.key});

  @override
  Widget build(BuildContext context) {
    final services = ServiceModel.services;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: services.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.57,
        ),
        itemBuilder: (context, index) {
          final service = services[index];
          return Column(
            children: [
              Container(
                height: 80.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      service.imageUrl,
                      height: 30.h,
                      width: 30.w,
                      fit: BoxFit.scaleDown,
                    )),
              ),
              SizedBox(height: 5.h),
              Container(
                height: 19.h,
                width: 65.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff8900FE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  service.discount,
                  style: GoogleFonts.dmSans(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              FittedBox(
                child: Text(
                  service.name,
                  style: GoogleFonts.dmSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

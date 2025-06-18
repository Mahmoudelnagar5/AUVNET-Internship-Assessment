import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/popular_model.dart';

class PopularList extends StatelessWidget {
  const PopularList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = PopularModel.getPopular();
    return SizedBox(
      height: 130.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(
          width: 10.w,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return Column(
            children: [
              Container(
                height: 70.h,
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                textAlign: TextAlign.center,
                item.name,
                style: GoogleFonts.dmSans(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    color: Colors.grey[600],
                    size: 12,
                  ),
                  Text(
                    item.time,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

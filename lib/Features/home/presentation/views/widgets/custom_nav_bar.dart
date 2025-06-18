import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomNavBar(
      {super.key, required this.onTap, required this.currentIndex});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: Color(0xFF484C52),
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        color: Color(0xFF484C52),
      ),
      items: [
        barItem("assets/home.png", "Home", 0),
        barItem("assets/category.svg", "Category", 1),
        barItem("assets/delivary.svg", "Delivery", 2),
        barItem("assets/cart.svg", "Cart", 3),
        barItem("assets/profile.svg", "Profile", 4),
      ],
    );
  }

  BottomNavigationBarItem barItem(String assetPath, String label, int index) {
    final isSelected = widget.currentIndex == index;
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            Container(
              width: 50,
              height: 6,
              decoration: BoxDecoration(
                color: Color(0xFF8900FE),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
            )
          else
            SizedBox(height: 4.h),
          SizedBox(height: 4.h),
          if (index == 0)
            Image.asset(assetPath, width: 24.w, height: 24.h)
          else
            SvgPicture.asset(assetPath, width: 24.w, height: 24.h),
        ],
      ),
      label: label,
    );
  }
}

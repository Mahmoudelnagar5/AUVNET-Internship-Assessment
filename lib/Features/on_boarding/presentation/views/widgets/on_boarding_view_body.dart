import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/services/hive_service.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../Auth/presentation/views/sign_in_view.dart';
import '../../../data/models/intro_model.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController controller;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<IntroModel> introductionItems = IntroModel.introductionList;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(Assets.ellipse),
          Positioned(
            top: 90.h,
            left: -10.w,
            child: Image.asset(
              Assets.nawel,
              width: 336.w,
              height: 336.h,
            ),
          ),

          PageView.builder(
            controller: controller,
            physics: const ClampingScrollPhysics(),
            itemCount: introductionItems.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final item = introductionItems[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      right: 0,
                      left: 0,
                      top: MediaQuery.sizeOf(context).height * .52,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            item.title,
                            style: GoogleFonts.rubik(
                              fontSize: 23.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            item.subTitle,
                            style: GoogleFonts.rubik(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .1,
            left: 12.w,
            right: 12.w,
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(295.w, 54.h),
                    backgroundColor: const Color(0xff8900FE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await HiveService.setOnBoardingViewSeen(true);
                    Navigator.pushReplacementNamed(
                      context,
                      SignInView.routeName,
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.rubik(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                TextButton(
                  onPressed: () {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                  child: Text(
                    'next',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13.sp,
                    ),
                  ),
                )
              ],
            ),
          ),

          // Page Indicator
        ],
      ),
    );
  }
}

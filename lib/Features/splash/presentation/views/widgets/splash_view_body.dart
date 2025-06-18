import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nawel/Features/Auth/presentation/views/sign_in_view.dart';
import 'package:nawel/Features/on_boarding/presentation/views/on_boarding_view.dart';

import '../../../../../core/services/firebase_auth_service.dart';
import '../../../../../core/services/hive_service.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../home/presentation/views/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomInDown(
      duration: const Duration(seconds: 5),
      child: Center(
        child: Image.asset(
          Assets.nawel,
        ),
      ),
    );
  }

  void excuteNaviagtion() {
    bool isOnBoardingViewSeen = HiveService.isOnBoardingViewSeen();
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        var isLoggedIn = FirebaseAuthService().isLoggedIn();

        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeLayout.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SignInView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}

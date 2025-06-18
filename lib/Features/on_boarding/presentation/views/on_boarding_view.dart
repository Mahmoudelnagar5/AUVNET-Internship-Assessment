import 'package:flutter/material.dart';

import 'package:nawel/Features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const routeName = 'onBoarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}

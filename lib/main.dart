import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/Features/Auth/presentation/views/sign_in_view.dart';
import 'package:nawel/Features/Auth/presentation/views/sign_up_view.dart';
import 'package:nawel/Features/home/presentation/views/home_view.dart';
import 'package:nawel/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:nawel/Features/splash/presentation/views/splash_view.dart';
import 'package:nawel/core/services/get_it_service.dart';
import 'package:nawel/core/services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive first
  await HiveService.init();

  // Initialize Firebase
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCL6bv0A5aW7tdqMyCE1VkF0LYEJGaslH0",
            authDomain: "nawel-1873e.firebaseapp.com",
            projectId: "nawel-1873e",
            storageBucket: "nawel-1873e.firebasestorage.app",
            messagingSenderId: "205294624339",
            appId: "1:205294624339:web:011eff4b10fc53315a70a6",
            measurementId: "G-1YYL3LYMPX"));
  } else {
    await Firebase.initializeApp();
  }

  // Initialize GetIt last
  setupGetit();

  runApp(DevicePreview(enabled: false, builder: (context) => const Nawel()));
}

class Nawel extends StatelessWidget {
  const Nawel({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'nawel store',
          home: child,
          routes: {
            HomeLayout.routeName: (context) => const HomeLayout(),
            SplashView.routeName: (context) => const SplashView(),
            OnBoardingView.routeName: (context) => const OnBoardingView(),
            SignInView.routeName: (context) => const SignInView(),
            SignUpView.routeName: (context) => const SignUpView(),
          },
        );
      },
      child: const SplashView(),
    );
  }
}

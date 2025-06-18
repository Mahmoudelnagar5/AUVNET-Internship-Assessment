import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/Features/Auth/presentation/views/sign_up_view.dart';
import 'package:nawel/core/widgets/custom_text_field.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../blocs/signin_bloc/sign_in_bloc.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  bool isPasswordVisible = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            SizedBox(height: 80.h),
            Image.asset(Assets.nawel),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: CustomTextField(
                onSaved: (value) {
                  email = value!;
                },
                prefixIcon: Icons.email_outlined,
                hintText: 'mail',
              ),
            ),
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: CustomTextField(
                onSaved: (value) {
                  password = value!;
                },
                prefixIcon: Icons.lock_outline,
                hintText: 'password',
                obscureText: !isPasswordVisible,
                suffixIcon: isPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                onIconPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
            ),
            SizedBox(height: 25.h),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<SignInBloc>().add(
                        SignInSubmitted(
                          email: email,
                          password: password,
                        ),
                      );
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: 'Log in',
            ),
            SizedBox(height: 10.h),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SignUpView.routeName);
              },
              child: Text(
                'Create an account',
                style: GoogleFonts.dmSans(
                  fontSize: 14.sp,
                  color: const Color(0xff1877F2),
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

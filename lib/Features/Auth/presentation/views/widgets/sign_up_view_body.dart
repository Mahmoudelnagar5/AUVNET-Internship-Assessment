import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/helper_function/show_bar_message.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../blocs/signup_bloc/sign_up_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, password, confirmPassword, userName;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
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
                  userName = value!;
                },
                prefixIcon: Icons.person_outline,
                hintText: 'username',
              ),
            ),
            SizedBox(height: 18.h),
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
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: CustomTextField(
                onSaved: (value) {
                  confirmPassword = value!;
                },
                prefixIcon: Icons.lock_outline,
                hintText: 'confirm password',
                obscureText: !isConfirmPasswordVisible,
                suffixIcon: isConfirmPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                onIconPressed: () {
                  setState(() {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  });
                },
              ),
            ),
            SizedBox(height: 25.h),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<SignUpBloc>().add(
                        SignUpSubmitted(
                          email: email,
                          password: password,
                          userName: userName,
                        ),
                      );
                } else {
                  showBar(context, 'Please fill all fields correctly');
                  setState(
                    () {
                      autovalidateMode = AutovalidateMode.always;
                    },
                  );
                }
              },
              text: 'sign up',
            ),
            SizedBox(height: 10.h),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Create an account',
                style: GoogleFonts.dmSans(
                  fontSize: 14.sp,
                  color: Color(0xff1877F2),
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

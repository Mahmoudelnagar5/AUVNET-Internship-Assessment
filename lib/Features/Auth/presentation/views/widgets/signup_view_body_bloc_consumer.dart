import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helper_function/show_bar_message.dart';
import '../../blocs/signup_bloc/sign_up_bloc.dart';
import 'sign_up_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.user != null) {
          Navigator.pop(context);
        }
        if (state.errorMessage != null) {
          showBar(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}

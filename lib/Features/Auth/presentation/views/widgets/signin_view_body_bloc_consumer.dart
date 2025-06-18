import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helper_function/show_bar_message.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../blocs/signin_bloc/sign_in_bloc.dart';
import 'sign_in_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.user != null) {
          Navigator.pushNamed(context, HomeLayout.routeName);
        }

        if (state.errorMessage != null) {
          showBar(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: const SignInViewBody(),
        );
      },
    );
  }
}

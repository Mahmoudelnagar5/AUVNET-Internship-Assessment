import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/Features/Auth/domain/repos/auth_repo.dart';
import 'package:nawel/Features/Auth/presentation/blocs/signup_bloc/sign_up_bloc.dart';
import 'package:nawel/core/services/get_it_service.dart';

import 'widgets/signup_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'signUp';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
        authRepo: getIt<AuthRepo>(),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: const SignupViewBodyBlocConsumer(),
      ),
    );
  }
}

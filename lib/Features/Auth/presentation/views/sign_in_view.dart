import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/Features/Auth/domain/repos/auth_repo.dart';
import 'package:nawel/Features/Auth/presentation/blocs/signin_bloc/sign_in_bloc.dart';
import 'package:nawel/core/services/get_it_service.dart';

import 'widgets/signin_view_body_bloc_consumer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'signIn';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(
        authRepo: getIt<AuthRepo>(),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: const SigninViewBodyBlocConsumer(),
      ),
    );
  }
}

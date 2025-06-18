import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/Features/Auth/domain/entites/user_entity.dart';
import 'package:nawel/Features/Auth/domain/repos/auth_repo.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepo authRepo;

  SignInBloc({required this.authRepo}) : super(SignInState.initial()) {
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  Future<void> _onSignInSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(SignInState.loading());

    final result = await authRepo.signinWithEmailAndPassword(
      event.email,
      event.password,
    );

    result.fold(
      (failure) => emit(SignInState.error(failure.message)),
      (user) => emit(SignInState.success(user)),
    );
  }
}

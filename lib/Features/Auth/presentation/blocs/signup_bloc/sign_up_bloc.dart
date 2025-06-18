import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/Features/Auth/domain/entites/user_entity.dart';
import 'package:nawel/Features/Auth/domain/repos/auth_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepo authRepo;

  SignUpBloc({required this.authRepo}) : super(SignUpState.initial()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpState.loading());

    final result = await authRepo.createUserWithEmailAndPassword(
      event.email,
      event.password,
      event.userName,
    );

    result.fold(
      (failure) => emit(SignUpState.error(failure.message)),
      (user) => emit(SignUpState.success(user)),
    );
  }
}

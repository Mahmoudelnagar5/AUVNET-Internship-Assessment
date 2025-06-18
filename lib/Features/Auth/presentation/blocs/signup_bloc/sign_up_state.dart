part of 'sign_up_bloc.dart';

class SignUpState {
  final bool isLoading;
  final UserEntity? user;
  final String? errorMessage;

  const SignUpState({
    this.isLoading = false,
    this.user,
    this.errorMessage,
  });

  SignUpState copyWith({
    bool? isLoading,
    UserEntity? user,
    String? errorMessage,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory SignUpState.initial() => const SignUpState();
  factory SignUpState.loading() => const SignUpState(isLoading: true);
  factory SignUpState.success(UserEntity user) => SignUpState(user: user);
  factory SignUpState.error(String message) =>
      SignUpState(errorMessage: message);
}

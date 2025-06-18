part of 'sign_in_bloc.dart';

class SignInState {
  final bool isLoading;
  final UserEntity? user;
  final String? errorMessage;

  const SignInState({
    this.isLoading = false,
    this.user,
    this.errorMessage,
  });

  SignInState copyWith({
    bool? isLoading,
    UserEntity? user,
    String? errorMessage,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory SignInState.initial() => const SignInState();
  factory SignInState.loading() => const SignInState(isLoading: true);
  factory SignInState.success(UserEntity user) => SignInState(user: user);
  factory SignInState.error(String message) =>
      SignInState(errorMessage: message);
}

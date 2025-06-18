import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/services/hive_service.dart';
import '../../domain/entites/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserModel(
        name: name,
        email: email,
        uId: user.uid,
      );
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } on FirebaseAuthException catch (e) {
      await deleteUser(user);
      log('FirebaseAuthException in createUserWithEmailAndPassword: ${e.message}');
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage =
              'This email is already registered. Please use a different email.';
          break;
        case 'invalid-email':
          errorMessage = 'Please enter a valid email address.';
          break;
        case 'weak-password':
          errorMessage =
              'Password is too weak. Please use a stronger password.';
          break;
        default:
          errorMessage =
              'An error occurred during registration. Please try again.';
      }
      return left(ServerFailure(errorMessage));
    } catch (e) {
      await deleteUser(user);
      log('Unexpected error in createUserWithEmailAndPassword: ${e.toString()}');
      return left(
        ServerFailure(
          'An unexpected error occurred. Please try again.',
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      try {
        await firebaseAuthService.deleteUser();
        await HiveService.deleteUser();
      } catch (e) {
        log('Error deleting user: ${e.toString()}');
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);

      // Try to get existing user data from Hive
      var existingUser = HiveService.getUser();

      var userEntity = UserModel(
        name: existingUser?.name ?? user.displayName ?? email.split('@')[0],
        email: user.email ?? '',
        uId: user.uid,
      );
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException in signinWithEmailAndPassword: ${e.message}');
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage =
              'No account found with this email. Please check your email or sign up.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password. Please try again.';
          break;
        case 'invalid-email':
          errorMessage = 'Please enter a valid email address.';
          break;
        case 'user-disabled':
          errorMessage =
              'This account has been disabled. Please contact support.';
          break;
        default:
          errorMessage = 'An error occurred during sign in. Please try again.';
      }
      return left(ServerFailure(errorMessage));
    } catch (e) {
      log('Unexpected error in signinWithEmailAndPassword: ${e.toString()}');
      return left(
        ServerFailure(
          'An unexpected error occurred. Please try again.',
        ),
      );
    }
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    try {
      await HiveService.saveUser(UserModel.fromEntity(user));
    } catch (e) {
      log('Error saving user data: ${e.toString()}');
    }
  }
}

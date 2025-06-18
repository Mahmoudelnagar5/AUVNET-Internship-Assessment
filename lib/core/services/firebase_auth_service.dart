import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exception.dart';

class FirebaseAuthService {
  static final FirebaseAuthService _instance = FirebaseAuthService._internal();
  factory FirebaseAuthService() => _instance;
  FirebaseAuthService._internal();

  Future deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } catch (e) {
      log('Error deleting user: ${e.toString()}');
      throw CustomException(message: 'Failed to delete user account.');
    }
  }

  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      switch (e.code) {
        case 'weak-password':
          throw CustomException(
              message:
                  'The password is too weak. Please use a stronger password.');
        case 'email-already-in-use':
          throw CustomException(
              message:
                  'This email is already registered. Please use a different email.');
        case 'invalid-email':
          throw CustomException(message: 'Please enter a valid email address.');
        case 'network-request-failed':
          throw CustomException(
              message: 'Please check your internet connection.');
        case 'operation-not-allowed':
          throw CustomException(
              message:
                  'Email/password accounts are not enabled. Please contact support.');
        default:
          throw CustomException(
              message:
                  'An error occurred during registration. Please try again.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");
      throw CustomException(
          message: 'An unexpected error occurred. Please try again.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      switch (e.code) {
        case 'user-not-found':
          throw CustomException(
              message:
                  'No account found with this email. Please check your email or sign up.');
        case 'wrong-password':
          throw CustomException(
              message: 'Incorrect password. Please try again.');
        case 'invalid-email':
          throw CustomException(message: 'Please enter a valid email address.');
        case 'user-disabled':
          throw CustomException(
              message:
                  'This account has been disabled. Please contact support.');
        case 'network-request-failed':
          throw CustomException(
              message: 'Please check your internet connection.');
        default:
          throw CustomException(
              message: 'An error occurred during sign in. Please try again.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");
      throw CustomException(
          message: 'An unexpected error occurred. Please try again.');
    }
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}

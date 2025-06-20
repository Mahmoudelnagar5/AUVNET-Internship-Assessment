import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);

  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password);

  Future saveUserData({required UserEntity user});
}

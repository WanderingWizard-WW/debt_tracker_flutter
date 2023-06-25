import 'package:debt_tracker/domain/entities/user_entity.dart';
import 'package:debt_tracker/domain/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthenticationRepository {
  Stream<UserEntity?> getAuthenticationChanges();

  Future<Either<Failure, void>> signInAnonymously();

  Future<Either<Failure, void>> singInWithGoogle({String? idToken, String? accessToken});
}

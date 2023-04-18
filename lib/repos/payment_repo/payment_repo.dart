import 'package:dartz/dartz.dart';
import 'package:paymob/Core/errors/failures.dart';

abstract class PaymentRepo {
  Future<Either<Failure, String>> getFirstToken();

  Future<Either<Failure, String>> getOrderId({required String price});

  Future<Either<Failure, String>> getFinalTokenCard({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  });

  Future<Either<Failure, String>> getFinalTokenKiosk({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  });

  Future<Either<Failure, String>> getRefCode();
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:paymob/Core/errors/failures.dart';
import 'package:paymob/repos/payment_repo/payment_repo.dart';
import '../../Core/utils/Api_service/api_service.dart';
import '../../Core/utils/api_service/end_point.dart';
import '../../constant.dart';

class PaymentRepoImp extends PaymentRepo {
  PaymentRepoImp(this._apiService);

  final ApiService _apiService;

  @override
  Future<Either<Failure, String>> getFinalTokenCard({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    try {
      final result = await _apiService.postData(
        url: finalToken,
        data: {
          'auth_token': payMobToken,
          'amount_cents': '${price}00',
          'expiration': 3600,
          'order_id': payMobOrderId,
          'billing_data': {
            'apartment': 'NA',
            'email': email,
            'floor': 'NA',
            'first_name': firstName,
            'street': 'NA',
            'building': 'NA',
            'phone_number': phone,
            'shipping_method': 'NA',
            'postal_code': 'NA',
            'city': 'NA',
            'country': 'NA',
            'last_name': lastName,
            'state': 'NA'
          },
          'currency': 'EGP',
          'integration_id': integrationIdCard,
          'lock_order_when_paid': 'false'
        },
      );
      payMobFinalToken = result.data['token'].toString();
      print('pay: $payMobFinalToken');
      return right(payMobFinalToken);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getFinalTokenKiosk({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    try {
      final result = await _apiService.postData(
        url: finalToken,
        data: {
          'auth_token': payMobToken,
          'amount_cents': '${price}00',
          'expiration': 3600,
          'order_id': payMobOrderId,
          'billing_data': {
            'apartment': 'NA',
            'email': email,
            'floor': 'NA',
            'first_name': firstName,
            'street': 'NA',
            'building': 'NA',
            'phone_number': phone,
            'shipping_method': 'NA',
            'postal_code': 'NA',
            'city': 'NA',
            'country': 'NA',
            'last_name': lastName,
            'state': 'NA'
          },
          'currency': 'EGP',
          'integration_id': integrationIdKiosk,
          'lock_order_when_paid': 'false'
        },
      );
      payMobFinalTokenKiosk = result.data['token'];
      print(payMobFinalTokenKiosk);
      return right(payMobFinalTokenKiosk);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getFirstToken() async {
    try {
      final result = await _apiService
          .postData(url: firstToken, data: {'api_key': payMobApiKey});
      payMobToken = result.data['token'];
      print(payMobToken);
      return right(payMobToken);
    } catch (e) {
      print(e.toString());
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getOrderId({required String price}) async {
    try {
      final result = await _apiService.postData(url: orderId, data: {
        'auth_token': payMobToken,
        'delivery_needed': 'false',
        'amount_cents': '${price}00',
        'currency': 'EGP',
        'items': [],
      });
      payMobOrderId = result.data['id'].toString();
      print(payMobOrderId);

      return right(payMobOrderId);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getRefCode() async {
    try {
      final result = await _apiService.postData(
        url: recCode,
        data: {
          'source': {
            'identifier': 'AGGREGATOR',
            'subtype': 'AGGREGATOR',
          },
          'payment_token': payMobFinalTokenKiosk,
        },
      );
        refCode = result.data['id'].toString();
      print(refCode);

      return right(refCode);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

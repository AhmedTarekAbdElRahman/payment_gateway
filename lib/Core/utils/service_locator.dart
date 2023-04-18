import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:paymob/repos/payment_repo/payment_repo_imp.dart';

import 'Api_service/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: 'https://accept.paymob.com/api/',
          receiveDataWhenStatusError: true,
        ),
      ),
    ),
  );
  getIt.registerSingleton<PaymentRepoImp>(
    PaymentRepoImp(getIt.get<ApiService>()),
  );
}

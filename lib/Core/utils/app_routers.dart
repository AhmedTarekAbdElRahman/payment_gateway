import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob/Core/utils/service_locator.dart';
import 'package:paymob/repos/payment_repo/payment_repo_imp.dart';
import 'package:paymob/view_models/payment_cubit/payment_cubit.dart';
import 'package:paymob/views/ref_view.dart';

import '../../views/card_view.dart';
import '../../views/register_view.dart';
import '../../views/toggle_view.dart';

class Routes {
  static const String registerView = "/";
  static const String toggleView = "/toggleView";
  static const String refCodeView = "/refCodeView";
  static const String cardView = "/cardcardView";
}

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.registerView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context) => PaymentCubit(getIt.get<PaymentRepoImp>()),child: const RegisterView()),
        );
      case Routes.toggleView:
        return MaterialPageRoute(
          builder: (_) => const ToggleView(),
        );
      case Routes.refCodeView:
        return MaterialPageRoute(
          builder: (_) => const RefCodeView(),
        );
      case Routes.cardView:
        return MaterialPageRoute(
          builder: (_) => const CardView(),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('noRouteFound'),
        ),
        body: const Center(
          child: Text('noRouteFound'),
        ),
      ),
    );
  }
}

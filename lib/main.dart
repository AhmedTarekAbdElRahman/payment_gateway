import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymob/Core/utils/app_routers.dart';
import 'package:paymob/constant.dart';
import 'Core/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(
    PayMob(
      appRouter: AppRouter(),
    ),
  );
}

class PayMob extends StatelessWidget {
  const PayMob({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter.generateRoute,
              theme: ThemeData(
                primarySwatch: kPrimaryColor,
                appBarTheme: const AppBarTheme(color: kPrimaryColor,),
              ),
            ),
          );
        });
  }
}

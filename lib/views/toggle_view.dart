import 'package:flutter/material.dart';
import 'package:paymob/Core/utils/app_routers.dart';
import 'package:paymob/Core/utils/assets.dart';
import '../Core/widgets/toggle_card.dart';

class ToggleView extends StatelessWidget {
  const ToggleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          ToggleCard(image: AssetsData.credit, text: 'Pay by credit card', navPath: Routes.cardView),
          ToggleCard(image: AssetsData.ref, text: 'Pay by refCode', navPath: Routes.refCodeView),
        ],
      ),
    );
  }
}


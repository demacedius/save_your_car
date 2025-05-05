import 'package:flutter/material.dart';
import 'vehicle_card.dart';

class VehicleListHorizontal extends StatelessWidget {
  const VehicleListHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
       // hauteur fixe obligatoire !
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => const VehicleCard(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'vehicle_card.dart';

class ActusSection extends StatelessWidget {
  const ActusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      // hauteur fixe obligatoire !
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        padding: const EdgeInsets.only(left: 0), // ou 24 si besoin
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24 : 12,
              right: index == 2 ? 24 : 0,
            ),
            child: const VehicleCard(),
          );
        },
      ),
    );
  }
}

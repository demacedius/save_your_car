import 'package:flutter/material.dart';
import 'package:save_your_car/widgets/Main_scaffold.dart';
import 'package:save_your_car/widgets/home_header.dart';
import 'package:save_your_car/widgets/search_bar.dart' as searchBar;
import 'package:save_your_car/widgets/vehicle_card.dart';

class MyVehicles extends StatelessWidget {
  const MyVehicles({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 1,
      child: Column(
        children: [
          // Header et search bar fixes
          Stack(
            clipBehavior: Clip.none,
            children: [
              const HomeHeader(),
              Positioned(
                left: 24,
                right: 24,
                bottom: -28,
                child: const searchBar.SearchBar(),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Liste scrollable uniquement
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: 10,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: VehicleCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

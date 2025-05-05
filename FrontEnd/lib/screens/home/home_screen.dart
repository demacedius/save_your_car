import 'package:flutter/material.dart';
import 'package:save_your_car/widgets/Main_scaffold.dart';
import 'package:save_your_car/widgets/actus_section.dart';
import 'package:save_your_car/widgets/home_header.dart';
import 'package:save_your_car/widgets/search_bar.dart' as searchBar; // <-- manquant
import 'package:save_your_car/widgets/shorcut_grid.dart';
import 'package:save_your_car/widgets/title_section.dart';
import 'package:save_your_car/widgets/vehicle_list_horizontal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const HomeHeader(),

                // SearchBar positionnée à moitié dans le header
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: -28, // moitié de la hauteur + spacing
                  child: const searchBar.SearchBar(),
                ),
              ],
            ),
            
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  VehicleListHorizontal(),
                  SizedBox(height: 24),
                  ShortcutGrid(),
                  SizedBox(height: 24),
                  SectionTitle(title: "Actus"),
                  SizedBox(height: 12),
                  ActusSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

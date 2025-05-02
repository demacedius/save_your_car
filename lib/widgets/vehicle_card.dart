import 'package:flutter/material.dart';
import 'package:save_your_car/theme/figma_color.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 341,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FigmaColors.neutral10,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // ✅ Hug content
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/Audi.png', width: 139, height: 89,),
             
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: FigmaColors.primaryFocus),
                    child: const Text(
                      "2022",
                      style: TextStyle(fontSize: 12, color: FigmaColors.primaryMain),
                    ),
                  ),
                  SizedBox(height: 8),
                  const Text(
                    "Audi A8",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Quattro",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Image.asset('assets/images/Audi svg.png', height: 20),
                ],
              ),
              const Icon(Icons.star, color: Colors.orange),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(thickness: 1, color: FigmaColors.neutral20,),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: const [
              _SpecItem(icon: Icons.speed, label: "540 hp"),
              _SpecItem(icon: Icons.settings, label: "Automatique"),
              _SpecItem(icon: Icons.event_seat, label: "5 Places"),
            ],
          ),
        ],
      ),
    );
  }
}

class _SpecItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SpecItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}

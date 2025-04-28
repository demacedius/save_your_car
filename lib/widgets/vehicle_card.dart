import 'package:flutter/material.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image voiture
              Image.asset(
                'assets/images/Audi.png',
                width: 150,
                height: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 12),

              // Infos voiture
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Badge année
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "2022",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Nom voiture
                    const Text(
                      "Audi A8\nQuattro",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8),
                    // Logo marque
                    Image.asset(
                      'assets/images/Audi svg.png', // petit logo audi en dessous
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              // Icône favori
              const Icon(
                Icons.star,
                color: Colors.orange,
              )
            ],
          ),

          const SizedBox(height: 16),
          const Divider(),

          

          // Spécifications (puissance, transmission, places)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(Icons.speed, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  const Text(
                    "540 hp",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.settings_input_component,
                      size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  const Text(
                    "Automatique",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.event_seat, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  const Text(
                    "5 Places",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
  
    );

  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:save_your_car/theme/figma_color.dart';
import 'package:save_your_car/widgets/stepper_components.dart';
import 'klm_screen.dart';
class MatriculeScreen extends StatelessWidget {
  const MatriculeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Center(
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFE4E4E4),
                          width: 1,
                        ),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.chevron_left,
                          size: 20,
                          color: Colors.black,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StepDot(isActive: true),
                      StepLine(isActive: false),
                      StepDot(isActive: false),
                      StepLine(isActive: false),
                      StepDot(isActive: false),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ), // Pour équilibrer avec le bouton retour
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Entrez Votre Plaque D\'immatriculation',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Pour pouvoir accéder au différentes données de votre véhicule. Veuillez entrez votre plaque d\'immatriculation.',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 24 / 16,
                  color: FigmaColors.neutral70,
                ),
              ),
              const SizedBox(height: 32),
              Container(
                width: 380,
                height: 201,
                decoration: BoxDecoration(
                  color: FigmaColors.primaryFocus,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: FigmaColors.neutral70, width: 3),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xFF003399),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Stack(
                                  children:
                                      List.generate(12, (index) {
                                        final angle =
                                            (index * (2 * 3.14159) / 12);
                                        final radius = 8.0;
                                        return Positioned(
                                          left: 12 + radius * cos(angle),
                                          top: 12 + radius * sin(angle),
                                          child: Transform.rotate(
                                            angle: angle + 3.14159 / 2,
                                            child: const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 4,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                ),
                              ),
                              const Text(
                                'FR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              hintText: 'AA-123-AA',
                              hintStyle: TextStyle(
                                color: FigmaColors.neutral50,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KlmScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FigmaColors.primaryMain,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Text(
                    'Continuer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Move these classes to lib/widgets/stepper_components.dart
// Add imports:
// import 'package:flutter/material.dart';
// import 'package:save_your_car/theme/figma_color.dart';



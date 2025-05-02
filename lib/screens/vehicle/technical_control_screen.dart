import 'package:flutter/material.dart';
import 'package:save_your_car/theme/figma_color.dart';
import 'package:save_your_car/widgets/stepper_components.dart';

class TechnicalControlScreen extends StatelessWidget {
  const TechnicalControlScreen({super.key});

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
                      StepDot(isActive: false),
                      StepLine(isActive: false),
                      StepDot(isActive: false),
                      StepLine(isActive: false),
                      StepDot(isActive: true),
                    ],
                  ),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Renseignez Vos Informations Concernant Le Véhicule',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Pour accéder aux caractéristiques techniques de votre véhicule, merci de fournir les informations demandées dans les champs prévus à cet effet.',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 24 / 16,
                  color: FigmaColors.neutral70,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 380,
                height: 201,
                child: Container(
                  decoration: BoxDecoration(
                    color: FigmaColors.primaryFocus,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 21,
                      top: 46,
                      bottom: 47,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Quelle est la date de votre dernier Contrôle technique ?',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 20 / 14,
                            letterSpacing: 0.01,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: FigmaColors.neutral10,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: false,
                                            border: InputBorder.none,
                                            hintText: 'Ecrire',
                                            hintStyle: const TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              height: 24 / 16,
                                              color: FigmaColors.neutral40,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: const BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                      child: const Text(
                        'Ignorer cette étape',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/home");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: FigmaColors.primaryMain,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: const BorderSide(
                            color: FigmaColors.primaryMain,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Continuer',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:save_your_car/theme/figma_color.dart';
import 'package:save_your_car/theme/figma_text_style.dart';


class ActusSection extends StatelessWidget {
  const ActusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // hauteur fixe, à ajuster selon la taille de tes cartes
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemBuilder: (context, index) {
          return Container(
            width: 280,
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: FigmaColors.neutral10,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Titre ${index + 1}",
                  style: FigmaTextStyles().textXXLBold
                ),
                const SizedBox(height: 8),
                Text(
                  "Contenu ou résumé de l’actualité.",
                  style: FigmaTextStyles().textMBold.copyWith(color: FigmaColors.neutral80),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

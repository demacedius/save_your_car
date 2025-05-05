import 'package:flutter/material.dart';
import 'package:save_your_car/theme/figma_color.dart';
import 'package:save_your_car/theme/figma_text_style.dart';
import 'package:save_your_car/widgets/title_section.dart';

class ShortcutGrid extends StatelessWidget {
  ShortcutGrid({super.key});
  final textStyles = FigmaTextStyles();

  @override
  Widget build(BuildContext context) {
    final shortcuts = [
      "Trouver un garage proche de chez moi",
      "Nos Conseils",
      "Ma progression",
      "Pièces",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: "Catégorie"),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: shortcuts.map((text) {
            return Container(
              height: 178,
              width: 138,
              decoration: BoxDecoration(
                color: FigmaColors.neutral10,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: FigmaColors.primaryFocus,
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/car-parts 1.png",
                        height: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: textStyles.textLBold,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

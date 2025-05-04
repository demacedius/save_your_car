import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_your_car/screens/document_screen.dart';
import 'package:save_your_car/theme/figma_color.dart';
import 'package:save_your_car/theme/figma_text_style.dart';
import 'package:save_your_car/widgets/Main_scaffold.dart';
import 'package:save_your_car/widgets/filter_categorie.dart';
import 'package:save_your_car/widgets/vehicle_piece_card.dart';

class VehicleDetail extends StatelessWidget {
  const VehicleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = FigmaTextStyles();

    return MainScaffold(
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 471,
                  decoration: const BoxDecoration(
                    color: FigmaColors.neutral100,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 24,
                      ), // pour laisser la place au bouton back
                      SvgPicture.asset(
                        "assets/images/Audi svg.svg",
                        width: 81,
                        height: 27,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Audi A8 Quattro",
                        style: textStyle.headingSBold.copyWith(
                          color: FigmaColors.neutral00,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Image.asset(
                        "assets/images/AudiXL.png",
                        width: 304,
                        height: 194,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),

                // ← bouton retour
                Positioned(
                  top: 68,
                  left: 24,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        size: 20,
                        color: FigmaColors.neutral00,
                      ),
                    ),
                  ),
                ),

                // ← bloc des 3 cartes info
                Positioned(
                  bottom: -54,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _infoCard(
                        icon: Transform.rotate(
                          angle: -90 * 3.1415926535 / 180,
                          child: const Icon(Icons.tune_rounded),
                        ),
                        title: "Année",
                        value: "2022",
                        textStyle: textStyle,
                      ),
                      const SizedBox(width: 12),
                      _infoCard(
                        icon: const Icon(Icons.speed),
                        title: "Kilométrage",
                        value: "150.000Km",
                        textStyle: textStyle,
                      ),
                      const SizedBox(width: 12),
                      _infoCard(
                        icon: const Icon(Icons.calendar_month_rounded),
                        title: "Contrôle",
                        value: "10/02/2026",
                        textStyle: textStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 64), // pour ne pas cacher les cards

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text("Pièces du véhicule", style: textStyle.textXXLBold),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: FilterCategory(),
            ),
            const SizedBox(height: 24),

            // Liste scrollable uniquement
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: 10,
                itemBuilder:
                    (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DocumentScreen()))
                        },
                        child: PiecesCard(),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({
    required Widget icon,
    required String title,
    required String value,
    required FigmaTextStyles textStyle,
  }) {
    return Container(
      width: 118,
      height: 108,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: FigmaColors.neutral10,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: FigmaColors.neutral30,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: icon),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: textStyle.captionXSMedium.copyWith(
              color: FigmaColors.neutral70,
            ),
          ),
          const SizedBox(height: 2),
          Text(value, style: textStyle.textMBold),
        ],
      ),
    );
  }
}

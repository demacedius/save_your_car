import 'package:flutter/material.dart';
import 'package:save_your_car/theme/figma_color.dart';
import 'package:save_your_car/theme/figma_text_style.dart';
import 'package:save_your_car/widgets/Main_scaffold.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_your_car/widgets/filter_categorie.dart';

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
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                    color: FigmaColors.neutral100,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  width: double.infinity,
                  height: 471,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24, top: 68),
                        child: Positioned(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(
                                  0.2,
                                ), // 👈 opacité 20%
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
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/Audi svg.svg",
                              width: 81,
                              height: 27,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Audi A8 Quattro",
                              style: textStyle.headingSBold.copyWith(
                                color: FigmaColors.neutral00,
                              ),
                            ),
                            Image.asset(
                              "assets/images/AudiXL.png",
                              width: 304,
                              height: 194,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: -460,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      Container(
                        width: 118,
                        height: 108,
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: FigmaColors.neutral10,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FigmaColors.neutral30,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              width: 32,
                              height: 32,
                              child: Transform.rotate(
                                angle: -90 * (3.1415926535 / 180),
                                child: Icon(Icons.tune_rounded),
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Année",
                              style: textStyle.captionXSMedium.copyWith(
                                color: FigmaColors.neutral70,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text("2022", style: textStyle.textMBold),
                          ],
                        ),
                      ),
                      Container(
                        width: 118,
                        height: 108,
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: FigmaColors.neutral10,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FigmaColors.neutral30,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              width: 32,
                              height: 32,
                              child: Icon(Icons.speed),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Kilométrage",
                              style: textStyle.captionXSMedium,
                            ),
                            SizedBox(height: 2),
                            Text(
                              "150.000Km",
                              style: textStyle.textMBold.copyWith(
                                color: FigmaColors.neutral70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 118,
                        height: 108,
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: FigmaColors.neutral10,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: FigmaColors.neutral30,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              width: 32,
                              height: 32,
                              child: Icon(Icons.calendar_month_rounded),
                            ),
                            SizedBox(height: 12),
                            Text("Contrôle", style: textStyle.captionXSMedium),
                            SizedBox(height: 2),
                            Text(
                              "10/02/2026",
                              style: textStyle.textMBold.copyWith(
                                color: FigmaColors.neutral70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text("Pièces du véhicule", style: textStyle.textXXLBold),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: FilterCategory(),
            ),
          ],
        ),
      ),
    );
  }
}

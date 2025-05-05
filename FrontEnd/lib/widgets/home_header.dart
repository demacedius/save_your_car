import 'package:flutter/material.dart';
import 'package:save_your_car/theme/figma_text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = FigmaTextStyles();
    final topPadding = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.fromLTRB(24, topPadding + 16, 24, 16),
      height: 187,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(

        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/Group 1.png'),
            radius: 24,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bonjour Sab !",
                style: textStyles.textXLBold.copyWith(color: Colors.white),
              ),
              Text(
                "Fixons votre véhicules",
                style: textStyles.textLRegular.copyWith(color: Colors.white70),
              ),
            ],
          ),
          const Spacer(),
          Stack(
            alignment: Alignment.topRight,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF2C2C2E),
                child: Icon(Icons.notifications, color: Colors.white),
              ),
              const Positioned(
                top: 2,
                right: 2,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.amber,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

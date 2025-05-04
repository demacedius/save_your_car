import 'package:flutter/material.dart';
import 'package:save_your_car/theme/figma_color.dart';
import 'package:save_your_car/theme/figma_text_style.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  int selectedIndex = 0;
  final textStyle = FigmaTextStyles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FigmaColors.neutral00,
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header noir
            Container(
              width: double.infinity,
              height: 246,
              color: FigmaColors.neutral100,
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:31),
                    child: Text(
                      "Ton Auto En Bonne Santé",
                      style: textStyle.headingMMedium.copyWith(
                        color: FigmaColors.neutral00,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left:31),
                    child: Text(
                      "Avec Save Your Car Plus+",
                      style: textStyle.headingSReguler.copyWith(
                        color: FigmaColors.neutral30,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
        
            const SizedBox(height: 32),
        
            // Abonnement mensuel
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _planTile(
                    title: "9,99€ / mois, annulable à tout moment",
                    badge: "Essai gratuit 3 jours",
                    selected: selectedIndex == 0,
                    onTap: () => setState(() => selectedIndex = 0),
                  ),
                  const SizedBox(height: 16),
                  _planTile(
                    title: "2,50€ / mois (29,99€/an)",
                    selected: selectedIndex == 1,
                    onTap: () => setState(() => selectedIndex = 1),
                  ),
                ],
              ),
            ),
        
            const Spacer(),
        
            // Bouton "Essayer gratuitement"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FigmaColors.primaryMain,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onPressed: () {
                    // TODO: activer abonnement
                  },
                  child: const Text(
                    "Essayer gratuitement",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: 12),
        
            // Infos légales
            Center(
              child: Column(
                children: [
                  Text(
                    "Sans engagement, annulable à tout moment",
                    style: textStyle.captionXSMedium.copyWith(
                      color: FigmaColors.neutral60,
                    ),
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () {
                      // TODO: lien vers conditions
                    },
                    child: Text(
                      "Déjà abonné ? – Conditions",
                      style: textStyle.captionXSMedium.copyWith(
                        decoration: TextDecoration.underline,
                        color: FigmaColors.neutral70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _planTile({
    required String title,
    required bool selected,
    required VoidCallback onTap,
    String? badge,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFEDEAFF) : FigmaColors.neutral00,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? FigmaColors.primaryMain : FigmaColors.neutral20,
            width: 2,
          ),
          boxShadow: [
            if (!selected)
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 6,
                offset: const Offset(0, 2),
              )
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (badge != null)
              Positioned(
                top: -24,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6B4EFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    badge,
                    style: textStyle.captionXSMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            Row(
              children: [
                Icon(
                  selected ? Icons.check_circle : Icons.circle_outlined,
                  color: selected ? FigmaColors.primaryMain : FigmaColors.neutral50,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: textStyle.textMSemiBold,
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:save_your_car/screens/paywallScreen.dart';
import 'package:save_your_car/theme/figma_color.dart';
import 'package:save_your_car/theme/figma_text_style.dart';
import 'package:save_your_car/widgets/Main_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final textStyle = FigmaTextStyles();

    return MainScaffold(
      currentIndex: 3,
      child: Scaffold(
        backgroundColor: FigmaColors.neutral00,
        body: SafeArea(
          top:false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                color: FigmaColors.neutral100,
                padding: EdgeInsets.only(left:24,top:68),
                width: double.infinity,
                height: 147,
                child: Text(
                  "Profile",
                  style: textStyle.headingMBold.copyWith(
                    color: FigmaColors.neutral00,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
      
              const SizedBox(height: 16),
      
              // Essayer Plus
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaywallScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: FigmaColors.primaryMain,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.flash_on, color: Colors.white),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Essayer Save Your Car Plus+",
                            style: textStyle.textMSemiBold.copyWith(color: Colors.white),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                      ],
                    ),
                  ),
                ),
              ),
      
              const SizedBox(height: 24),
      
              // Options
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    _ProfileOption(title: "Edit Profile", icon: Icons.person_outline),
                    _ProfileOption(title: "Notification", icon: Icons.notifications_none),
                    _ProfileOption(title: "Langage", icon: Icons.language),
                    _ProfileOption(title: "Aide", icon: Icons.help_outline),
                    _ProfileOption(title: "Inviter des amis", icon: Icons.group_outlined),
                    const SizedBox(height: 12),
                    _LogoutButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final String title;
  final IconData icon;

  const _ProfileOption({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: FigmaColors.neutral10,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: FigmaColors.neutral90),
          const SizedBox(width: 12),
          Expanded(
            child: Text(title, style: FigmaTextStyles().textMSemiBold),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: FigmaColors.neutral60),
        ],
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: FigmaColors.neutral10,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.logout, size: 20, color: Colors.red),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Log out",
              style: FigmaTextStyles().textMSemiBold.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

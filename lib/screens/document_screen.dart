import 'package:flutter/material.dart';
import 'package:save_your_car/theme/figma_color.dart';
import 'package:save_your_car/theme/figma_text_style.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = FigmaTextStyles();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // Header
            Container(
              height: 162,
              width: double.infinity,
              decoration: const BoxDecoration(color: FigmaColors.neutral100),
              child: Stack(
                children: [
                  Positioned(
                    top: 64,
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Documents",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -35,
                    right: 24,
                    left: 24,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: FigmaColors.neutral10,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Colors.grey),
                            const SizedBox(width: 12),
                            Text(
                              "Chercher un document",
                              style: textStyle.textMRegular.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            // Barre de recherche

            // Liste scrollable
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: 20,
                itemBuilder:
                    (context, index) => const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: DocumentCard(),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DocumentCard extends StatelessWidget {
  const DocumentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = FigmaTextStyles();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FigmaColors.neutral10,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          Container(
            width: 48,
            height: 64,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage("assets/images/Document thumbnail.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date + Titre
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: FigmaColors.primaryFocus,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            "20/02/2025",
                            style: textStyle.captionSMedium.copyWith(
                              color: FigmaColors.primaryMain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Révision 130 000 km",
                          style: textStyle.textLBold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Divider(indent: 0, thickness: 1, color: FigmaColors.neutral70),
                SizedBox(height: 8),
                Text(
                  "Filtres à l'huiles · Filtres à air · Courroie de distribution",
                  style: textStyle.captionSMedium.copyWith(
                    color: FigmaColors.neutral70,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

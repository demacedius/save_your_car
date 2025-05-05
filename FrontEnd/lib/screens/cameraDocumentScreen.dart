import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:save_your_car/theme/figma_color.dart';

class ScannerDocumentScreen extends StatefulWidget {
  const ScannerDocumentScreen({super.key});

  @override
  State<ScannerDocumentScreen> createState() => _ScannerDocumentScreenState();
}

class _ScannerDocumentScreenState extends State<ScannerDocumentScreen> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final backCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.back,
    );

    controller = CameraController(
      backCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await controller?.initialize();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Camera preview
          CameraPreview(controller!),

          // SafeArea + retour
          SafeArea(
            top: false,
            child: Container(
              width: double.infinity,
              height: 120,
              color: FigmaColors.neutral100,
              child: Stack(
                children: [
                  Positioned(
                    left: 24,
                    top: 68,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: FigmaColors.neutral00.withOpacity(0.2),
                      ),
                      child: Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 20,
                          icon: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Overlay de détection du document
          Center(
            child: Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(color: FigmaColors.primaryMain, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: 140,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Text(
              'Document',
              style: TextStyle(
                color: FigmaColors.primaryMain,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.image, color: Colors.white),
                  onPressed: () {}, // galerie
                ),
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    color: FigmaColors.primaryMain,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.camera_alt, color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.restart_alt, color: Colors.white),
                  onPressed: () {}, // reset
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

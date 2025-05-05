import 'package:flutter/material.dart';
import 'package:save_your_car/theme/figma_color.dart';

class MainScaffold extends StatefulWidget {
  final Widget child;
  final int currentIndex;

  const MainScaffold({
    super.key,
    required this.child,
    this.currentIndex = 0,
  });

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/vehicles');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/calendar');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/scanner');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(top:false, child: widget.child),
      bottomNavigationBar: SizedBox(
        height: 96,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Barre blanche arrondie
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _navIcon(Icons.home, 0),
                    _navIcon(Icons.directions_car_filled, 1),
                    const SizedBox(width: 48), // Espace pour le bouton central
                    _navIcon(Icons.calendar_today, 2),
                    _navIcon(Icons.person_outline, 3),
                  ],
                ),
              ),
            ),

            // Floating scanner button
            Positioned(
              top: 0,
              child: GestureDetector(
                onTap: () => _onItemTapped(4),
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: FigmaColors.primaryMain,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.document_scanner, color: Colors.white, size: 28),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navIcon(IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Icon(
        icon,
        size: 28,
        color: _selectedIndex == index ? Colors.black : Colors.grey.shade400,
      ),
    );
  }
}

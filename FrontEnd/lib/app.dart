import 'package:flutter/material.dart';
import 'package:save_your_car/models/vehicles.dart';
import 'package:save_your_car/screens/vehicle/klm_screen.dart';
import 'routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: appRoutes,
  onGenerateRoute: (settings) {
    if (settings.name == '/klm') {
      final vehicle = settings.arguments as VehicleData;
      return MaterialPageRoute(
        builder: (_) => KlmScreen(vehicle: vehicle),
      );
    }
    return null;
  },
);
  }
}

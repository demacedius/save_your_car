import 'package:flutter/material.dart';
import 'package:save_your_car/screens/appointment_screen.dart';
import 'package:save_your_car/screens/auth/login_screen.dart';
import 'package:save_your_car/screens/auth/sign_up_screen.dart';
import 'package:save_your_car/screens/auth/welcome_screen.dart';
import 'package:save_your_car/screens/cameraDocumentScreen.dart';
import 'package:save_your_car/screens/home/home_screen.dart';
import 'package:save_your_car/screens/profil.dart';
import 'package:save_your_car/screens/vehicles/my_vehicles.dart';
import 'package:save_your_car/screens/vehicle/matricule_screen.dart';
import 'package:save_your_car/screens/vehicle/klm_screen.dart';
import 'package:save_your_car/screens/vehicle/technical_control_screen.dart';
import '../screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashScreen(),
  '/welcome': (context) => const WelcomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/sign_up': (context) => const SignUpScreen(),
  '/matricule': (context) => const MatriculeScreen(),
  '/klm': (context) => const KlmScreen(),
  '/technical-control': (context) => const TechnicalControlScreen(),
  '/home': (context) => const HomeScreen(),
  '/vehicles':(context) => const MyVehicles(),
  '/scanner':(context) => const ScannerDocumentScreen(),
  '/calendar':(context) => const AppointmentScreen(), 
  '/profile': (context) => const ProfileScreen(),
};

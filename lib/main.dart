import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await availableCameras();
  runApp(const App());
}

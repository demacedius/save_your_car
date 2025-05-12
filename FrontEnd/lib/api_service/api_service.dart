import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:save_your_car/models/vehicles.dart';

Future<VehicleData?> fetchVehicleInfo(String plate) async {
  final url = Uri.parse('http://10.0.2.2:3333/vehicles/from-plate');
  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'plate': plate}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return VehicleData.fromJson(data);
    } else {
      print('Erreur ${response.statusCode}: ${response.body}');
      return null;
    }
  } catch (e) {
    print('Erreur lors de l’appel API: $e');
    return null;
  }
}

Future<Map<String, dynamic>?> registerUserWithVehicle({
  required String fullName,
  required String email,
  required String password,
  required VehicleData vehicle,
}) async {
  final url = Uri.parse('http://10.0.2.2:3333/register-with-vehicle');
  final data = {
  'fullName': fullName,
  'email': email,
  'password': password,
  'plate': vehicle.plate,
  'model': vehicle.model,
  'brand': vehicle.brand,
  'year': vehicle.year,
  'mileage': vehicle.mileage,
  'technicalControlDate': vehicle.technicalControlDate?.toIso8601String(),
  'imageUrl': vehicle.imageUrl,
};
  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        data
      }
      ),
    );
      print('📤 Données envoyées : $data');

    if (response.statusCode == 201) {
      print('✅ Inscription réussie : ${response.body}');
      return jsonDecode(response.body);
    } else {
      print('Erreur ${response.statusCode}: ${response.body}');
      return null;
    }
  } catch (e) {
    print('Erreur lors de l’appel API: $e');
    return null;
  }
}


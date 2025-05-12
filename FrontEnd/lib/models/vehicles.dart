class VehicleData {
  final String plate;
  final String model;
  final String brand;
  final String? imageUrl;
  final int? year;
  final int? mileage;
  final DateTime? technicalControlDate;

  VehicleData({
    required this.plate,
    required this.model,
    required this.brand,
    this.imageUrl,
    this.year,
    this.mileage,
    this.technicalControlDate,
  });

  factory VehicleData.fromJson(Map<String, dynamic> json) {
    return VehicleData(
      plate: json['plate'],
      model: json['model'],
      brand: json['brand'],
      imageUrl: json['imageUrl'],
      year: json['year'],
      mileage: json['mileage'],
      technicalControlDate: json['technicalControlDate'] != null
          ? DateTime.tryParse(json['technicalControlDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plate': plate,
      'model': model,
      'brand': brand,
      'imageUrl': imageUrl,
      'year': year,
      'mileage': mileage,
      'technicalControlDate': technicalControlDate?.toIso8601String(),
    };
  }

  VehicleData copyWith({
    String? plate,
    String? model,
    String? brand,
    String? imageUrl,
    int? year,
    int? mileage,
    DateTime? technicalControlDate,
  }) {
    return VehicleData(
      plate: plate ?? this.plate,
      model: model ?? this.model,
      brand: brand ?? this.brand,
      imageUrl: imageUrl ?? this.imageUrl,
      year: year ?? this.year,
      mileage: mileage ?? this.mileage,
      technicalControlDate: technicalControlDate ?? this.technicalControlDate,
    );
  }
}

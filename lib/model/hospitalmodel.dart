
class HospitalModel {
  final String name;
  final String phone;
  final String details;

  HospitalModel({
    required this.name,
    required this.phone,
    required this.details,
  });

  // Convert JSON to Model
  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      details: json['address'] ?? '',
    );
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': details,
    };
  }
}

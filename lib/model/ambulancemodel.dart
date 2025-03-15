
class AmbulanceModel {
  final String name;
  final String phone;
  final String details;

  AmbulanceModel({
    required this.name,
    required this.phone,
    required this.details,
  });

  // Convert JSON to Model
  factory AmbulanceModel.fromJson(Map<String, dynamic> json) {
    return AmbulanceModel(
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

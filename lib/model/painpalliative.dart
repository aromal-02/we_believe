


class PainPalliative {
  final String name;
  final String phone;
  final String details;

  PainPalliative({
    required this.name,
    required this.phone,
    required this.details,
  });

  // Convert JSON to Model
  factory PainPalliative.fromJson(Map<String, dynamic> json) {
    return PainPalliative(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      details: json['details'] ?? '',
    );
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'details': details,
    };
  }
}

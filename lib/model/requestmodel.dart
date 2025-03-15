class RequestModel {
  final String address;
  final String age;
  final String date;
  final String gender;
  final String group;
  final String name;
  final String phone;
  final String unit;
  final String docId;

  RequestModel({
    required this.address,
    required this.age,
    required this.date,
    required this.gender,
    required this.group,
    required this.name,
    required this.phone,
    required this.unit,
     required this.docId,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      address: json['address'],
      age: json['age'],
      date: json['date'],
      gender: json['gender'],
      group: json['group'],
      name: json['name'],
      phone: json['phone'],
      unit: json['unit'],
      docId: json['docId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'age': age,
      'date': date,
      'gender': gender,
      'group': group,
      'name': name,
      'phone': phone,
      'unit': unit,
      'docId': docId,
    };
  }
}

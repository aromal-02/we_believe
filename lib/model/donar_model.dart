class DonarMOdel {
  final String address;
  final String age;
  final String gender;
  final String group;
  final String name;
  final String phone;
  final String unit;
  final bool donate;
  final String docId;

  DonarMOdel( {required this.donate, 
    required this.address,
    required this.age,
    required this.gender,
    required this.group,
    required this.name,
    required this.phone,
    required this.unit, required this.docId,
  });

  // Factory method to create an instance from a JSON map
  factory DonarMOdel.fromJson(Map<String, dynamic> json) {
    return DonarMOdel(
      address: json['address'] ?? '',
      age: json['age'] ?? '',
      gender: json['gender'] ?? '',
      group: json['group'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      unit: json['unit'] ?? '',
       donate: json['donate']??false,
       docId:json['docId']??''
       
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'age': age,
      'gender': gender,
      'group': group,
      'name': name,
      'phone': phone,
      'unit': unit,
      'donate':donate,'docId':docId
    };
  }
}

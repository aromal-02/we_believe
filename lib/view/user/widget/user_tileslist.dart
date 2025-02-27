
import 'package:donation/view/user/pagehome/ambulence_service_page/ambulence_service.dart';
import 'package:donation/view/user/pagehome/available_donar/available_donar.dart';
import 'package:donation/view/user/pagehome/blood_instraction_page/blood_instraction.dart';
import 'package:donation/view/user/pagehome/blood_request_page/blood_request.dart';
import 'package:donation/view/user/pagehome/doner_registration_page/terms%20_and_conditions.dart';
import 'package:donation/view/user/pagehome/helpline/helpline_page.dart';
import 'package:donation/view/user/pagehome/hospitals/hospitals.dart';
import 'package:donation/view/user/pagehome/pain_and_palliative_page/pain_and_palliative.dart';

class Options {
  late String name;

  late String image;

  Options({
    required this.name,
    required this.image,
  });
}

final List<Options> tileList = [
  Options(
    name: "DonorRegistration",
    image: "assets/images/donar Registration.jpg",
  ),
  Options(
    name: "Blood Request",
    image: "assets/images/user reques.png",
  ),
  Options(
    name: "Ambulance Service",
    image: "assets/images/ambulancee.jpg",
  ),
  Options(
    name: "Pain and Palliative",
    image: "assets/images/care.jpg",
  ),
  Options(
    name: "Hospitals",
    image: "assets/images/hospital.png",
  ),
  Options(
    name: "Helpline",
    image: "assets/images/helpline.png",
  ),
  Options(
    name: "Blood Instruction",
    image: "assets/images/instructions.png",
  ),
  
  Options(name: "Available Donar", image: "assets/images/available2.jpg")
];

final List optionScreen = [
  const DonorRegistration(),
  const BloodRequest(),
   ClientAmbulanceService(),
  const PainAndPalliative(),
  const client_hospital(),
  const Helpline(),
  const BloodInstraction(),
   AvailableDonors(),
];


import 'package:donation/view/superadmin/pagehome/ambulence_service_page/ambulance_service.dart';
import 'package:donation/view/superadmin/pagehome/donor_registration_page/donor_terms%20_and_conditions.dart';
import 'package:donation/view/superadmin/pagehome/find_donor/find_donar_home.dart';
import 'package:donation/view/superadmin/pagehome/helpline/helpline_page.dart';
import 'package:donation/view/superadmin/pagehome/hospitals/hospitals.dart';
import 'package:donation/view/superadmin/pagehome/pain_and_palliative_page/pain_and_palliative.dart';
import 'package:donation/view/superadmin/pagehome/recent_donation_history/recent_donation_history_home.dart';
import 'package:donation/view/superadmin/pagehome/user_request/user_request_homepage.dart';
import 'package:donation/view/user/pagehome/blood_instraction_page/blood_instraction.dart';

class SuperadminOptions {
  late String name;

  late String image;

  SuperadminOptions({
    required this.name,
    required this.image,
  });
}

final List<SuperadminOptions> admintileList = [

  SuperadminOptions(
    name: "User Request",
    image: "assets/images/user reques.png",
  ),
  SuperadminOptions(
    name: "Recent Donation History",
    image: "assets/images/donation history.jpg",
  ),
  SuperadminOptions(
    name: "Donor Registration",
    image: "assets/images/donar Registration.jpg",
  ),
 
 
  SuperadminOptions(
    name: "Find Donor",
    image: "assets/images/donarfind1.webp",
  ),
  SuperadminOptions(
    name: "Ambulance Service",
    image: "assets/images/ambulancee.jpg",
  ),
  SuperadminOptions(
    name: "Pain and Palliative",
    image: "assets/images/care.jpg",
  ),
  SuperadminOptions(
    name: "Hospitals",
    image: "assets/images/hospital.png",
  ),
  SuperadminOptions(
    name: "Helpline",
    image: "assets/images/helpline.png",
  ),
  SuperadminOptions(
    name: "Blood Instruction",
    image: "assets/images/instructions.png",
  ),
 
];

final List SuperadminoptionScreen = [
  UserRequestHome(),
  Super_RecentDonationHistoryHome(),
  DonorRegistration(),
  FindDonar(),
   AmbulanceService(),
  PainAndPalliative_super(),
   Super_Hospitals(),
   Helpline(),
   BloodInstraction(),
];

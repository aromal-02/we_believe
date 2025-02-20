
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
  // const DonorRegistration(),
  // const BloodRequest(),
  // const ClientAmbulanceService(),
  // const PainAndPalliative(),
  // const client_hospital(),
  // const Helpline(),
  // const BloodInstraction(),
  //  Client_NssActivities(),
  //  AvailableDonors(),
];

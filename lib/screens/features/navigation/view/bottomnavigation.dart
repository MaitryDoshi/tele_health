import 'package:get/get.dart';
import 'package:tele_health/screens/core/core_export.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  RxInt index = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => buildPage()),
      bottomNavigationBar: Obx(() => buildBottomNavigation()),
    );
  }

  Widget buildPage() {
    switch (index.value) {
      case 1:
        return const Appointment();
      case 2:
        return const PatientRecord();
      case 3:
        return const More();
      case 0:
      default:
        return const Service();
    }
  }

  Widget buildBottomNavigation() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            Images.hospitalHomeIcon,
            width: Dimensions.cartWidgetSize,
          ),
          label: 'Service',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Images.appointmentIcon,
            width: Dimensions.cartWidgetSize,
          ),
          label: 'Appointment',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Images.patientRecordIcon,
            width: Dimensions.cartWidgetSize,
          ),
          label: 'Patient Record',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Images.moreIcon,
            width: Dimensions.cartWidgetSize,
          ),
          label: 'More',
        ),
      ],
      currentIndex: index.value,
      selectedItemColor: Colors.black,
      onTap: (int indexes) {
        setState(() {
          index.value = indexes;
        });
      },
    );
  }
}
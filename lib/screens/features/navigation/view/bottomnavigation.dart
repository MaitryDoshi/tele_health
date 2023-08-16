import 'package:get/get.dart';
import 'package:tele_health/screens/core/core_export.dart';

class BottomNavigation extends StatefulWidget {
  final int pageIndex;
  const BottomNavigation({Key? key, required this.pageIndex}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final int _pageIndex = 0;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  bool _canExit = GetPlatform.isWeb ? true : false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          Get.find<BottomNavController>().changePage(BnbItem.services);
          return false;
        } else {
          if (_canExit) {
            return true;
          } else {
            _canExit = true;
            Timer(const Duration(seconds: 2), () {
              _canExit = false;
            });
            return false;
          }
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        floatingActionButton: InkWell(
          child: Container(
            height: 70,
            width: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _pageIndex == 2
                  ? null
                  : Get.isDarkMode
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
              gradient: _pageIndex == 2
                  ? const LinearGradient(
                colors: [Color(0xFFFBBB00), Color(0xFFFF833D)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
                  : null,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 60 + MediaQuery.of(context).padding.top,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
            color:Get.isDarkMode ? Theme.of(context).cardColor.withOpacity(.5) : Theme.of(context).primaryColor,
            child: Row(children: [
              _bnbItem(
                  icon: Images.hospitalHomeIcon,
                  bnbItem: BnbItem.services,
                  onTap: () {
                    Get.find<BottomNavController>().changePage(BnbItem.services);
                  },
                  context: context),
              _bnbItem(
                  icon: Images.appointmentIcon,
                  bnbItem: BnbItem.appointment,
                  onTap: () {
                    Get.find<BottomNavController>().changePage(BnbItem.appointment);
                  },
                  context: context),
              _bnbItem(
                  icon: Images.patientRecordIcon,
                  bnbItem: BnbItem.patientRecord,
                  onTap: () {
                    Get.find<BottomNavController>().changePage(BnbItem.patientRecord);
                  },
                  context: context),
              _bnbItem(
                  icon: Images.moreIcon,
                  bnbItem: BnbItem.more,
                  onTap: () {
                    Get.find<BottomNavController>().changePage(BnbItem.more);
                  },
                  context: context),
            ]),
          ),
        ),
        body: Obx(() => _bottomNavigationView()),
      ),
    );
  }

  Widget _bnbItem({
    required String icon,
    required BnbItem bnbItem,
    required GestureTapCallback onTap,
    context}) {
    return Obx(() => Expanded(
        child: InkWell(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon.isEmpty ? const SizedBox(width: 20, height: 20) : Image.asset(
                  icon,
                  width: 18,
                  height: 18,
                  color: Get.find<BottomNavController>().currentPage.value == bnbItem
                      ? Colors.white
                      : Theme.of(context).secondaryHeaderColor,
                ),
              ]),
        )));
  }

  Widget _bottomNavigationView() {
    switch (Get.find<BottomNavController>().currentPage.value) {
      case BnbItem.appointment:
        return const Appointment();
      case BnbItem.patientRecord:
        return const PatientRecord();
      case BnbItem.more:
        return const More();
      default:
        return const Service();
    }
  }
}

import 'package:get/get.dart';
import 'package:tele_health/screens/core/core_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _navigateTo();
    // bool firstTime = true;
    // _onConnectivityChanged = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   if(!firstTime) {
    //     bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
    //     isNotConnected ? const SizedBox() : ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       backgroundColor: isNotConnected ? Colors.red : Colors.green,
    //       duration: Duration(seconds: isNotConnected ? 6000 : 3),
    //       content: Text(
    //         isNotConnected ? 'no_connection'.tr : 'connected'.tr,
    //         textAlign: TextAlign.center,
    //       ),
    //     ));
    //     if(!isNotConnected) {
    //       _route();
    //     }
    //   }
    //   firstTime = false;
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        body: Container(
          padding: const EdgeInsets.all(25.0),
          constraints: const BoxConstraints.expand(),
          child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    Images.logo,
                    width: Dimensions.mainScreenLogoSize,
                  ),
                  AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText("We care for you!",
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            speed: const Duration(milliseconds: 100)),
                      ]
                  ),
                  AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText("نحن نهتم بك!",
                            textStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            speed: const Duration(milliseconds: 100)),
                      ]
                  ),
                ],
              )
          ),
        )
    );
  }

  _navigateTo() async {
    Timer(const Duration(milliseconds: 3000), () async {
        Get.offAll(() => const BottomNavigation(), transition: Transition.rightToLeft, popGesture: true);
    });
  }
}

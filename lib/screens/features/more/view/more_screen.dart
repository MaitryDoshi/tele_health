import 'package:get/get.dart';
import 'package:tele_health/screens/core/core_export.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Images.backgroundImage),
              fit: BoxFit.cover,
            ),
            color: const Color(0xFFEFF8FB),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      Images.logo,
                    )
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeMini,
                ),
                InkWell(
                  onTap: () {
                    Get.offAll(const Login(), transition: Transition.downToUp, popGesture: true);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(child: Text('Login or Register', style: TextStyle(fontSize: 18.0, color: Colors.blueAccent),),),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xFFEFF8FB),
                  ),
                  child: Column(
                      children: [
                        Container(
                            height: 110,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(padding: EdgeInsets.all(10.0),
                                  child: Text("Settings",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ListTile(
                                      leading: Image.asset(Images.languageIcon),
                                      title: const Text("Language"),
                                      trailing: const Icon(Icons.arrow_forward_ios),
                                      onTap: () {
                                       // Get.to(());
                                      },
                                    ),
                                )
                              ],
                            )
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  } 
}
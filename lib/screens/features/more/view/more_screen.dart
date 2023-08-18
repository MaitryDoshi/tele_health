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
                  height: Dimensions.paddingSizeSmall,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xFFEFF8FB),
                  ),
                  child: Column(
                      children: [
                        Container(
                            height: 160,
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
                                  ListTile(
                                    leading: Image.asset(Images.language, width: Dimensions.paddingSizeExtraMore, height: Dimensions.paddingSizeExtraMore,),
                                    title: const Text("Language"),
                                    trailing: const Icon(Icons.arrow_forward_ios),
                                    onTap: () {
                                      // Get.to(());
                                    },
                                  ),
                                const Divider(
                                  height: 1,
                                ),
                                  ListTile(
                                    leading: Image.asset(Images.profile, width: Dimensions.paddingSizeExtraMore, height: Dimensions.paddingSizeExtraMore,),
                                    title: const Text("Profile"),
                                    trailing: const Icon(Icons.arrow_forward_ios),
                                    onTap: () {
                                      // Get.to(());
                                    },
                                )
                              ],
                            )
                        ),
                        const SizedBox(
                          height: Dimensions.paddingSizeLarge,
                        ),
                        Container(
                            height: 280,
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
                                  child: Text("More",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                ),
                                ListTile(
                                    leading: Image.asset(Images.info, width: Dimensions.paddingSizeExtraMore, height: Dimensions.paddingSizeExtraMore,),
                                    title: const Text("About Us"),
                                    trailing: const Icon(Icons.arrow_forward_ios),
                                    onTap: () {
                                      // Get.to(());
                                    },
                                  ),
                                const Divider(
                                  height: 1,
                                ),
                                ListTile(
                                    leading: Image.asset(Images.terms, width: Dimensions.paddingSizeExtraMore, height: Dimensions.paddingSizeExtraMore,),
                                    title: const Text("Terms and Conditions"),
                                    trailing: const Icon(Icons.arrow_forward_ios),
                                    onTap: () {
                                      // Get.to(());
                                    },
                                ),
                                const Divider(
                                  height: 1,
                                ),
                                ListTile(
                                    leading: Image.asset(Images.privacy, width: Dimensions.paddingSizeExtraMore, height: Dimensions.paddingSizeExtraMore,),
                                    title: const Text("Privacy Policy"),
                                    trailing: const Icon(Icons.arrow_forward_ios),
                                    onTap: () {
                                      // Get.to(());
                                    },
                                ),
                                const Divider(
                                  height: 1,
                                ),
                                ListTile(
                                  leading: Image.asset(Images.signIn, width: Dimensions.paddingSizeExtraMore, height: Dimensions.paddingSizeExtraMore,),
                                  title: const Text("Sign In"),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    Get.to(() => const Login());
                                  },
                                )
                              ],
                            )
                        ),
                        const SizedBox(
                          height: Dimensions.paddingSizeLarge,
                        ),
                        Container(
                            height: 165,
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
                                  child: Text("Contact",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                ),
                                 ListTile(
                                    leading: Image.asset(Images.contact, width: Dimensions.paddingSizeExtraMore, height: Dimensions.paddingSizeExtraMore,),
                                    title: const Text("Contact Us"),
                                    trailing: const Icon(Icons.arrow_forward_ios),
                                    onTap: () {
                                      // Get.to(());
                                    },
                                  ),
                                const Divider(
                                  height: 1,
                                ),
                                ListTile(
                                    leading: Image.asset(Images.media, width: Dimensions.paddingSizeExtraMore, height: Dimensions.paddingSizeExtraMore,),
                                    title: const Text("Our Social Media"),
                                    trailing: const Icon(Icons.arrow_forward_ios),
                                    onTap: () {
                                      // Get.to(());
                                    },
                                )
                              ],
                            )
                        ),
                      ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  } 
}
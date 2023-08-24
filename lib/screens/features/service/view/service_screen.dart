import 'package:tele_health/screens/core/core_export.dart';

class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(Images.logo, width: 100, height: 100,),
        backgroundColor: const Color(0xFFEFF8FB)),
        body: Scrollbar(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: const BoxDecoration(
                color: Color(0xFFEFF8FB),
              ),
              child: Column(
                  children: [
                    const SizedBox(
                      height: Dimensions.paddingSizeExtraLarge,
                    ),
                    Container(
                        height: 280,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(8.0),
                                child: const Text.rich(
                                  TextSpan(
                                    text: 'By click Continue you agree to our ',
                                    style: TextStyle(fontSize: 14,),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Terms and Condition ',
                                          style: TextStyle(
                                            color: Colors.blueAccent,
                                            decoration: TextDecoration.underline,
                                          )),
                                      TextSpan(
                                          text: 'and '),
                                      TextSpan(
                                          text: 'Privacy Policy',
                                          style: TextStyle(
                                            color: Colors.blueAccent,
                                            decoration: TextDecoration.underline,
                                          )),
                                      // can add more TextSpans here...
                                    ],
                                  ),
                                )
                            ),
                          ],
                        )
                    ),
                  ]
              ),
            )
        )
    );
  }
}
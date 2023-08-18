import 'package:get/get.dart';
import 'package:tele_health/screens/core/core_export.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _phone = TextEditingController();

  final GlobalKey<FormState> customerSignInKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Verification"),
      ),
          body: Scrollbar(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.4,
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
                           phoneFiled(),
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
                            submit()
                          ],
                        )
                    ),
                  ]
              ),
            )
          )
    );
  }

  String? phonenumber;
  Widget phoneFiled() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: IntlPhoneField(
          cursorColor: Colors.red,
          controller: _phone,
          decoration: InputDecoration(
            hintText: 'Phone Number',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          initialCountryCode: 'IN',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (phone) {
            phonenumber = phone.completeNumber;
          },
          onSubmitted: (val) {
            _phone.text = val;
          },
          validator: (value) {
            if (value != null && value != 10) {
              return 'Number must be of 10 digit';
            }
            else
            {return null;}
          },
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r"[0-9]+|\s"),
            )
          ],
          onCountryChanged: (country) {
          })
    );
  }

  Widget submit() {
    return InkWell(
      onTap: () {
        Get.to(() => const Registration());
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Center(child: Text('Continue', style: TextStyle(fontSize: 18.0, color: Colors.white),),),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:tele_health/screens/core/core_export.dart';
import 'package:timer_count_down/timer_controller.dart';

class OtpGen extends StatefulWidget {
  const OtpGen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OtpGenState();
  }
}

//For stateful widget we need a state class

class OtpGenState extends State<OtpGen> {
  final CountdownController _controller = CountdownController(autoStart: true);
  OtpFieldController otpController = OtpFieldController();

  @override
  void dispose() {
    super.dispose();
  }

  // DioServiceClient dio = DioServiceClient();
  // String? uniqueId = Get.arguments[0].toString();

  @override
  void initState() {
    super.initState();
  }

  String? otpValue;
  bool timerEnd = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          padding: const EdgeInsets.all(25.0),
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(color: Colors.white),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                heading(),
                OTPTextField(
                    controller: otpController,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 45,
                    fieldStyle: FieldStyle.underline,
                    outlineBorderRadius: 15,
                    style: const TextStyle(fontSize: 17),
                    onChanged: (pin) {
                    },
                    onCompleted: (pin) {
                      otpValue = pin;
                    }),
                if (timerEnd) ...[
                  resendOtp(),
                ],
                submit(),
              ],
            ),
          )),
    );
  }

  // for heading
  Widget heading() {
    return SizedBox(
        width: double.infinity,
        child: Column(children: <Widget>[
          const Text("OTP Verification", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const Padding(padding: EdgeInsets.all(5.0)),
          const Text(
            "We sent the code to your registered mobile number and Email Id",
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.all(20.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "6-Digit OTP",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.left,
              ),
              Countdown(
                  controller: _controller,
                  seconds: 120,
                  build: (BuildContext context, double time) => Text(formatTime(time.toInt()), textAlign: TextAlign.right, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  interval: const Duration(seconds: 1),
                  onFinished: () {
                    setState(() {
                      timerEnd = true;
                    });
                  })
            ],
          )
        ]));
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int ss = (seconds % 60);
    // return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
    return "${minutes.toString().padLeft(2, "0")}:${ss.toString().padLeft(2, "0")}";
  }

  // submit button
  Widget resendOtp() {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  "OTP not received ?",
                  style: TextStyle(color: Colors.grey),
                )),
            TextButton(
                onPressed: () async {
                  setState(() {
                    timerEnd = false;
                  });
                  _controller.onRestart!();
                  // PreSignUpResponse? res = await dio.resendotp(uid: uniqueId);
                  // if (res?.statuscode == 1) {
                  //   showsnack("OTP have been Resend ");
                  //
                  //   uniqueId = res?.data?.uid;
                  // } else {
                  //   showsnack("Something went wrong please try again later");
                  // }
                },
                child: const Text(
                  "Resend OTP",
                  style: TextStyle(color: Colors.grey, fontSize: 16.0, fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }

  // submit button
  Widget submit() {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 50,
            width: 320,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(33, 110, 243, 1), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
              onPressed: () async {
                if (otpValue?.length == 6) {
                  Get.to(() => const Verification());
                  // PreSignUpResponse? res = await dio.getotp(uid: uniqueId, otp: otpValue!);
                  // print(res?.data!.uid);
                  // print(res?.statuscode);
                  //
                  // if (res?.statuscode == 1) {
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => const OtpVerified()),
                  //   );
                  // } else if (res?.statuscode == 0) {
                  //   showdio(res!.statusMessage);
                  //   // showsnack(res.statusMessage!);
                  // }
                } else {
                  showdio("Enter 6 Digit OTP, Entered Value is less than 6 Digits");
                }
              },
              child: const Text(
                "SUBMIT",
                style: TextStyle(fontFamily: 'Sfpro', fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showsnack(String value) {
    final snackBar = SnackBar(
      content: Text(value),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showdio(String? data) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: const Text(
              "INFO",
              textAlign: TextAlign.center,
            ),
            content: Text('$data'),
            actions: <Widget>[
              TextButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A4083),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          );
        });
  }
}
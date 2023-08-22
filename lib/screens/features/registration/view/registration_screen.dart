import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tele_health/screens/core/core_export.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _dob = TextEditingController();
  final _captcha = TextEditingController();

  static const values1 = <String>['Male', 'Female'];
  String selectedValue1 = '';

  int _currentStep = 0;
  bool _curStep = false;
  StepperType stepperType = StepperType.horizontal;
  final _captchaFormKey = GlobalKey<FormState>();
  final _localCaptchaController = LocalCaptchaController();
  final _configFormData = ConfigFormData();
  var _inputCode = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _localCaptchaController.dispose();
    super.dispose();
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
          title: const Text("Account Setup"),
        ),
        body: Form(
            key: _captchaFormKey,
            child: Column(
              children: [
                Expanded(
                  child: Theme(
                    data: ThemeData(
                        colorScheme: const ColorScheme.light(
                            primary: Colors.blueAccent
                        )
                    ),
                    child: Stepper(
                      type: stepperType,
                      physics: const ScrollPhysics(),
                      currentStep: _currentStep,
                      onStepTapped: (step) => tapped(step),
                      onStepContinue: continued,
                      onStepCancel: cancel,
                      controlsBuilder: controlsBuilder,
                      steps: <Step>[
                        Step(
                          title: const Text('Step 1'),
                          content: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _firstName,
                                decoration: const InputDecoration(labelText: 'First Name'),
                              ),
                              TextFormField(
                                controller: _lastName,
                                decoration: const InputDecoration(labelText: 'Lst Name'),
                              ),
                              TextFormField(
                                controller: _email,
                                decoration: const InputDecoration(labelText: 'Email Address'),
                              ),
                            ],
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 0 ?
                          StepState.complete : StepState.disabled,
                        ),
                        Step(
                          title: const Text('Step 2'),
                          content: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _dob,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () { datepicker(_dob); },
                                        icon: const Icon(
                                          Icons.calendar_month,
                                          color: Colors.black,)
                                    ),
                                    labelText: 'Date of Birth'),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 10.0),
                                alignment: Alignment.centerLeft,
                                child: const Text('Gender'),
                              ),
                              Column(
                                children: values1.map(
                                      (value) {
                                    return RadioListTile<String>(
                                      value: value,
                                      groupValue: selectedValue1,
                                      title: Text(value),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue1 = value!;
                                        });
                                      },
                                    );
                                  },
                                ).toList(),
                              ),
                            ],
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 1 ?
                          StepState.complete : StepState.disabled,
                        ),
                        Step(
                          title: const Text('Step 3'),
                          content: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _captcha,
                                decoration: const InputDecoration(
                                  labelText: 'Enter Captcha code',
                                  hintText: 'Enter Captcha code',
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value != null && value.isNotEmpty) {
                                    if (value.length != _configFormData.length) {
                                      return '* Code must be length of ${_configFormData.length}.';
                                    }
                                    final validation = _localCaptchaController.validate(value);
                                    switch (validation) {
                                      case LocalCaptchaValidation.invalidCode:
                                        return '* Invalid code.';
                                      case LocalCaptchaValidation.codeExpired:
                                        return '* Code expired.';
                                      case LocalCaptchaValidation.valid:
                                      default:
                                        return null;
                                    }
                                  }
                                  return '* Required field.';
                                },
                                onSaved: (value) => _inputCode = value ?? '',
                              ),
                              const SizedBox(height: 16.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  LocalCaptcha(
                                    key: ValueKey(_configFormData.toString()),
                                    controller: _localCaptchaController,
                                    height: 60,
                                    width: 200,
                                    backgroundColor: Colors.grey[100]!,
                                    chars: _configFormData.chars,
                                    length: _configFormData.length,
                                    fontSize: _configFormData.fontSize > 0 ? _configFormData.fontSize : null,
                                    caseSensitive: _configFormData.caseSensitive,
                                    codeExpireAfter: _configFormData.codeExpireAfter,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: IconButton(onPressed: () { _localCaptchaController.refresh();}, icon: const Icon(Icons.refresh_outlined, size: 30,)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          isActive:_currentStep >= 0,
                          state: _currentStep >= 2 ?
                          StepState.complete : StepState.disabled,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: switchStepsType,
        child: const Icon(Icons.list),
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ?
    setState(() {
      _currentStep += 1;
      if(_currentStep == 2){
        _curStep = true;
      }
    }): null;
  }

  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }

  Widget controlsBuilder(context, details){
    return Row(
      children: [
        ElevatedButton(
            onPressed: _currentStep < 2
                ? details.onStepContinue
                : _curStep == true ? Get.to(() => const OtpGen()) : null,
          child: Text((_currentStep < 2) ? "Continue" : "Confirm")),
        const SizedBox(width: 10,),
        _currentStep != 0
            ? ElevatedButton(
            onPressed: details.onStepCancel,
            child: const Text("Back"))
            : Container(),
      ],
    );
  }

  Future<void> datepicker(TextEditingController con) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String formattedDate = DateFormat('d/M/y').format(pickedDate);
      setState(() {
        con.text = formattedDate; //set output date to TextField value.
      });
    } else {
    }
  }
}

class ConfigFormData {
  String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
  int length = 5;
  double fontSize = 0;
  bool caseSensitive = true;
  Duration codeExpireAfter = const Duration(minutes: 10);

  @override
  String toString() {
    return '$chars$length$caseSensitive${codeExpireAfter.inMinutes}';
  }
}
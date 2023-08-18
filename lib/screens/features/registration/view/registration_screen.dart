import 'package:get/get.dart';
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
  final _gender = TextEditingController();
  final _captcha = TextEditingController();

  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

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
          title: const Text("Account Setup"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: const ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue:  continued,
                onStepCancel: cancel,
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
                          controller: _firstName,
                          decoration: const InputDecoration(labelText: 'Date of Birth'),
                        ),
                        TextFormField(
                          controller: _firstName,
                          decoration: const InputDecoration(labelText: 'Gender'),
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
                          decoration: const InputDecoration(labelText: 'Enter Captcha'),
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
          ],
        ),
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
    setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }
}

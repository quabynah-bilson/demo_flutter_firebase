import 'package:bloodapp/onboarding/sign_up_individual.dart';
import 'package:bloodapp/onboarding/sign_up_institution.dart';
import 'package:flutter/material.dart';
import 'package:bloodapp/custom_styles.dart';

class SignUp1Screen extends StatelessWidget {
  const SignUp1Screen({Key? key}) : super(key: key);
  static const String id = "SignUp1Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image(image: AssetImage('images/Group.png'), color: KColor1),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up as',
                    style: TextStyle(color: KColor1, fontSize: 24),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    color: KColor1,
                    height: 50,
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpInstitution.id);
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Institution',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    color: KColor1,
                    height: 50,
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpIndividual.id);
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Individual',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

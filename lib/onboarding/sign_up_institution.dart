import 'package:bloodapp/custom_widgets/textfield_class.dart';
import 'package:bloodapp/onboarding/login_hospital.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloodapp/custom_styles.dart';

class SignUpInstitution extends StatefulWidget {
  const SignUpInstitution({Key? key}) : super(key: key);
  static const String id = "SignUpInstitution";

  @override
  State<SignUpInstitution> createState() => _SignUpInstitutionState();
}

class _SignUpInstitutionState extends State<SignUpInstitution> {
  bool loading = false;
  String? email;
  String? hospitalName;
  String? location;
  String? hospitalContact;
  String? password;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> signUp() async {
    setState(() {
      loading = true;
    });
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: KColor4,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    TextfieldClass(
                      onChanged: (value) {
                        hospitalName = value;
                      },
                      labeltext: "Hospital Name",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextfieldClass(
                      onChanged: (value) {
                        location = value;
                      },
                      labeltext: "Location",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextfieldClass(
                      onChanged: (value) {
                        hospitalContact = value;
                      },
                      labeltext: "Hospital Contact",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextfieldClass(
                      onChanged: (value) {
                        email = value;
                      },
                      labeltext: "Email",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextfieldClass(
                      onChanged: (value) {
                        password = value;
                      },
                      labeltext: "Create Password",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextfieldClass(
                      onChanged: (value) {
                        //TO-DO
                      },
                      labeltext: "Attach Logo",
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        //Navigate to splash 1
                        // Navigator.pushNamed(context, LoginHospitalScreen.id);
                        signUp();
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.white60),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LoginHospitalScreen.id);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

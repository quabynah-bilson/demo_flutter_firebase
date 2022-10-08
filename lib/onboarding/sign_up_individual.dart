// ignore_for_file: unused_local_variable

import 'package:bloodapp/custom_widgets/textfield_class.dart';
import 'package:bloodapp/onboarding/home_page.dart';
import 'package:bloodapp/onboarding/login_individual.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloodapp/custom_styles.dart';

class SignUpIndividual extends StatefulWidget {
  const SignUpIndividual({Key? key}) : super(key: key);
  static const String id = "SignUpIndividual";

  @override
  State<SignUpIndividual> createState() => _SignUpIndividualState();
}

class _SignUpIndividualState extends State<SignUpIndividual> {
  bool loading = false;
  String? email;
  String? number;
  String? address;
  String? bloodType;
  String? password;
  String? bloodDonation;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    getuser();
    super.initState();
  }

  Future<void> getuser() async {
    await _firebaseAuth.currentUser?.updateDisplayName(bloodType);
    // don't use async for setState. And also it is recommended that you execute
    // your code outside it's block before invoking it.
    setState(() {});
  }

  Future<void> signUp() async {
    setState(() {
      loading = true;
    });
    try {
      dynamic newUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      if (newUser != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      }
      ;

      await _firebaseAuth.currentUser?.updateDisplayName(bloodType);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
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
                        number = value;
                      },
                      labeltext: "Phone Number",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextfieldClass(
                      onChanged: (value) {
                        address = value;
                      },
                      labeltext: "Address",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextfieldClass(
                      onChanged: (value) {
                        bloodType = value;
                      },
                      labeltext: "Blood Type",
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
                        bloodDonation = value;
                      },
                      labeltext: "Blood Donation",
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
                        signUp();
                        // Navigator.pushNamed(context, LoginIndividualScreen.id);
                      },
                      child: loading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Text('Sign Up'),
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
                        Navigator.pushNamed(context, LoginIndividualScreen.id);
                      },
                      child: Text(
                        ' Login',
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

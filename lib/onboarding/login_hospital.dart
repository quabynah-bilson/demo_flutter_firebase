import 'package:bloodapp/custom_widgets/textfield_class.dart';
import 'package:bloodapp/onboarding/home_screen.dart';
import 'package:bloodapp/onboarding/sign_up_institution.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloodapp/custom_styles.dart';

class LoginHospitalScreen extends StatefulWidget {
  const LoginHospitalScreen({Key? key}) : super(key: key);
  static const String id = "LoginHospitalScreen";

  @override
  State<LoginHospitalScreen> createState() => _LoginHospitalScreenState();
}

class _LoginHospitalScreenState extends State<LoginHospitalScreen> {
  bool loading = false;
  String? email;
  String? name;
  String? password;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signIn() async {
    setState(() {
      loading = true;
    });
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
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
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    TextfieldClass(
                      onChanged: (value) => email = value,
                      labeltext: "Email",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextfieldClass(
                      onChanged: (value) => name = value,
                      labeltext: "Hospital Name",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextfieldClass(
                      onChanged: (value) => password = value,
                      labeltext: "Password",
                    ),
                    SizedBox(
                      height: 300,
                    ),
                    MaterialButton(
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        //Navigate to splash 1
                        // Navigator.pushNamed(context, HomeScreen.id);
                        signIn();
                      },
                      child: loading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Text('Login'),
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
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.white60),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpInstitution.id);
                      },
                      child: Text(
                        'Sign Up',
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

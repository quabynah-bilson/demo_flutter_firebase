import 'package:bloodapp/custom_widgets/textfield_class.dart';
import 'package:bloodapp/onboarding/sign_up_individual.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloodapp/custom_styles.dart';
import 'package:bloodapp/onboarding/home_page.dart';

class LoginIndividualScreen extends StatefulWidget {
  const LoginIndividualScreen({Key? key}) : super(key: key);
  static const String id = "LoginIndividualScreen";

  @override
  State<LoginIndividualScreen> createState() => _LoginIndividualScreenState();
}

class _LoginIndividualScreenState extends State<LoginIndividualScreen> {
  bool loading = false;
  String? email;
  String? number;
  String? password;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signIn() async {
    setState(() {
      loading = true;
    });
    try {
      dynamic newUser = await _firebaseAuth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      if (newUser != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      }
      ;
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
                      onChanged: (value) => number = value,
                      labeltext: "Phone Number",
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
                        Navigator.pushNamed(context, SignUpIndividual.id);
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

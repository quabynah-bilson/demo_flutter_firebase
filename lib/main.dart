import 'package:bloodapp/firebase_options.dart';
import 'package:bloodapp/onboarding/consult_screen.dart';
import 'package:bloodapp/onboarding/donateblood_screen.dart';
import 'package:bloodapp/onboarding/donorinfo_screen.dart';
import 'package:bloodapp/onboarding/donors_screen.dart';
import 'package:bloodapp/onboarding/healthtips_screen.dart';
import 'package:bloodapp/onboarding/home_page.dart';
import 'package:bloodapp/onboarding/home_screen.dart';
import 'package:bloodapp/onboarding/facts_screen1.dart';
import 'package:bloodapp/onboarding/facts_screen2.dart';
import 'package:bloodapp/onboarding/facts_screen3.dart';
import 'package:bloodapp/onboarding/facts_splash.dart';
import 'package:bloodapp/onboarding/login_hospital.dart';
import 'package:bloodapp/onboarding/login_individual.dart';
import 'package:bloodapp/onboarding/messages_screen.dart';
import 'package:bloodapp/onboarding/news_screen.dart';
import 'package:bloodapp/onboarding/request_blood.dart';
import 'package:bloodapp/onboarding/settings_screen.dart';
import 'package:bloodapp/onboarding/sign_up1.dart';
import 'package:bloodapp/onboarding/sign_up_individual.dart';
import 'package:bloodapp/onboarding/sign_up_institution.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'onboarding/onboarding2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const NeedBlood());
}

class NeedBlood extends StatelessWidget {
  const NeedBlood({Key? key}) : super(key: key);
  void done() {
    print("Wors");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
          stream: _firebaseAuth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if ((FirebaseAuth.instance.currentUser!.email!.isEmpty)) {
                return const Onbaording2();
              } else {
                return const HomeScreen();
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      routes: {
        Onbaording2.id: (context) => const Onbaording2(),
        FactsSplash.id: (context) => const FactsSplash(),
        FactsScreen1.id: (context) => const FactsScreen1(),
        FactsScreen2.id: (context) => const FactsScreen2(),
        FactsScreen3.id: (context) => const FactsScreen3(),
        SignUp1Screen.id: (context) => const SignUp1Screen(),
        SignUpInstitution.id: (context) => const SignUpInstitution(),
        SignUpIndividual.id: (context) => const SignUpIndividual(),
        LoginHospitalScreen.id: (context) => const LoginHospitalScreen(),
        LoginIndividualScreen.id: (context) => const LoginIndividualScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        HomePage.id: (context) => const HomePage(),
        HealthTipsScreen.id: (context) => const HealthTipsScreen(),
        MessagesScreen.id: (context) => const MessagesScreen(),
        NewsScreen.id: ((context) => const NewsScreen()),
        SettingScreen.id: ((context) => const SettingScreen()),
        RequestBloodScreen.id: (context) => const RequestBloodScreen(),
        DonateBlood.id: (context) => const DonateBlood(),
        ConsultScreen.id: (context) => const ConsultScreen(),
        DonorsScreen.id: (context) => const DonorsScreen(),
        DonorInfo.id: (context) => const DonorInfo(),
      },
    );
  }
}

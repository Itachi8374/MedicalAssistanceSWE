import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/data_stores/doctor_data.dart';
import 'package:medical_app/data_stores/user_data.dart';
import 'package:medical_app/ui/doctor_home.dart';
import 'package:medical_app/ui/patient_home.dart';
import 'package:medical_app/ui/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserData>().user;
    return FutureBuilder(
      future: UserData(FirebaseAuth.instance).userType,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == "Doctor") {
            return DoctorHome();
          } else {
            return PatientHome();
          }
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

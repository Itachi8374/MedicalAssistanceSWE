import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/data_stores/user_data.dart';
import 'package:medical_app/ui/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<UserData>().userType,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                body: SafeArea(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hello ${context.read<UserData>().fullName}",
                  style: TextStyle(fontSize: 20),
                ),
                Center(
                  child: Container(
                    width: 300,
                    child: CustomButton(onTap: () {}, text: "Search Doctor"),
                  ),
                ),
                Center(
                    child: Container(
                        width: 300,
                        child: CustomButton(
                            onTap: () {}, text: "Search by Name"))),
                CustomButton(onTap: () {}, text: "Search by Speciality"),
                CustomButton(onTap: () {}, text: "Search by Symptoms")
              ],
            )));
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

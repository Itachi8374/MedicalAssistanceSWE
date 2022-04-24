import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorData{
  Future<void> addDoctor(String doctorID,String doctorName) async {
    CollectionReference users = FirebaseFirestore.instance.collection('UserData');
    await users.doc(doctorID).set({"Name":doctorName});
  }
}
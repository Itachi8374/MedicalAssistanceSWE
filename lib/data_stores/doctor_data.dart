import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/models/doctor_model.dart';
import 'package:string_validator/string_validator.dart';

class DoctorData{

  Future<void> addDoctor(String doctorID,String doctorName) async {
    CollectionReference doctorData = FirebaseFirestore.instance.collection('DoctorData');
    await doctorData.doc(doctorID).set({"Name":doctorName});
  }

  Future<List<Doctor>> get getAllDoctors async {
    CollectionReference doctorData = FirebaseFirestore.instance.collection('DoctorData');
    QuerySnapshot querySnapshot = await doctorData.get();
    List<QueryDocumentSnapshot> doctorDocs = querySnapshot.docs;
    List<Doctor> allDocs = [];
    for (int i=0; i<doctorDocs.length; i++) {
      String doctorName = doctorDocs[i]["Name"];
      String  doctorID = doctorDocs[i].id;
      Doctor doctorInstance = Doctor(fullName: doctorName, userId: doctorID);
      allDocs.add(doctorInstance);
    }
    return allDocs;
  }

  Future<List<Doctor>> searchDoctorByName(String searchName) async {
    List<Doctor> result = []; // Variable to store final result
    // Check if search String is of valid length and type
    // Else raise an Exception
    if (searchName.length < 5 || searchName.length > 20) {
      throw Exception("Search string length not between 5 to 20");
    } else if (!isAlpha(searchName)) {
      throw Exception("Search string is not completely alphabetic");
    }
    // Get all doctors from Doctor Data store
    List<Doctor> allDoctorsAvailable = await getAllDoctors;
    // Filter out all doctors based on those who contain same name as search string
    for (int index=0; index<allDoctorsAvailable.length; index++) {
      // Check if search string is a substring of any doctor's name
      // Convert both doctor name and search string to lowercase for case insensitivity
      if (allDoctorsAvailable[index].fullName.toLowerCase().contains(searchName.toLowerCase())) {
        // If match found, add to result list
        result.add(allDoctorsAvailable[index]);
      }
    }
    return result;
  }

}
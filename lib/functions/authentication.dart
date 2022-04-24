
import 'package:firebase_auth/firebase_auth.dart';

Future<void> login({
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    print(e.message!); // Displaying the error message
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn.instance;

  Future<void> signInWithGoogle() async {
    await googleSignIn.initialize();

    final GoogleSignInAccount googleSignInAccount =
        await googleSignIn.authenticate(scopeHint: ['email']);

    final GoogleSignInAuthentication googleSignInAuthentication =
        googleSignInAccount.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
    );

    await auth.signInWithCredential(authCredential);
  }
}

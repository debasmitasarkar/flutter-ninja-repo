import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  static final Auth _auth = new Auth._internal();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  GoogleSignInAccount currentUser;

  static final CollectionReference categoryRef =
      Firestore.instance.collection('categories');
  
  factory Auth() {
    _auth.init();
    return _auth;
  }
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  Auth._internal();
  init() async {
    //await signInSilently();
    // await createBulkUser();
    //await addAssignedCardsFieldToCustomer();
    // await modifyIdIntToStringAttendant();
    // await addProductStationIdAndPasswordToAttendant();
    // await transactionTableDataChange();
  }

  Future handleSignIn() async {
    try {
      return await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> handleSignOut() async {
    _googleSignIn.disconnect();
  }
}

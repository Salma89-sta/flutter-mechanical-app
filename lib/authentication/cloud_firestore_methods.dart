import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/dataModel.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadUserToDataBase(
      {required String name, required String phone, required String type}) async {
    await firebaseFirestore.collection('user').doc(
        firebaseAuth.currentUser!.uid).set(
        {
          'name': name,
          'phone': phone,
          'type': type,
        }
    );
  }

  // Future getUserData() async {
  //   DocumentSnapshot snap = await firebaseFirestore
  //       .collection("user")
  //       .doc(firebaseAuth.currentUser!.uid)
  //       .get();
  //
  //   UserDetailsModel userModel = UserDetailsModel.getModelFromJson(
  //     (snap.data() as dynamic),
  //   );
  //
  //   return userModel;
  // }

}

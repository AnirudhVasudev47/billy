import 'package:cloud_firestore/cloud_firestore.dart';

class Rewards{

  final FirebaseFirestore firebaseFirestore;

  Rewards(this.firebaseFirestore);

  Stream<QuerySnapshot> getRewards(){
    Stream<QuerySnapshot> rewardsStream = FirebaseFirestore.instance.collection('offers').snapshots();

    return rewardsStream;
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/users.dart';

class FireStoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final DateTime date = DateTime.now();

  Future<void> createUser(id, email, username, {photoUrl = ""}) async {
    await _firebaseFirestore.collection("users").doc(id).set({
      "username": username,
      "email": email,
      "photoUrl": photoUrl,
      "creationDate": date,
      "programCreated": false,
      "gender": "",
      "experience": "",
      "objective": "",
      "workoutDays": 0,
      "age": 0,
      "weight": 0,
      "height": 0,
      "paidMember": false,
      "selectedDiet": "",
    });
  }

  Future<AppUsers?> searchUser(id) async {
    DocumentSnapshot data =
        await _firebaseFirestore.collection("users").doc(id).get();
    if (data.exists) {
      AppUsers? user = AppUsers.fromDocument(data);
      return user;
    } else {
      return null;
    }
  }

  updateUser(String? userId,
      {String? userName,
      String? photoUrl = "",
      bool? programCreated,
      String? gender,
      String? experience,
      String? objective,
      int? workoutDays,
      int? age,
      int? weight,
      int? height,
      bool? paidMember}) {
    _firebaseFirestore.collection("users").doc(userId).update({
      "username": userName,
      "photoUrl": photoUrl,
      "programCreated": programCreated,
      "gender": gender,
      "experience": experience,
      "objective": objective,
      "workoutDays": workoutDays,
      "age": age,
      "weight": weight,
      "height": height,
      "paidMember": paidMember
    });
  }

  updatePhoto(
    String? userId, {
    String? photoUrl,
  }) {
    _firebaseFirestore.collection("users").doc(userId).update({
      "photoUrl": photoUrl,
    });
  }

  updateProgramCreated(
    String? userId, {
    bool? programCreated,
  }) {
    _firebaseFirestore.collection("users").doc(userId).update({
      "programCreated": programCreated,
    });
  }

  updateGender(
    String? userId, {
    String? gender,
  }) {
    _firebaseFirestore.collection("users").doc(userId).update({
      "gender": gender,
    });
  }

  updateExperience(
    String? userId, {
    String? experience,
  }) {
    _firebaseFirestore.collection("users").doc(userId).update({
      "experience": experience,
    });
  }

  updateObjective(
    String? userId, {
    String? objective,
  }) {
    _firebaseFirestore.collection("users").doc(userId).update({
      "objective": objective,
    });
  }

  updateworkoutDays(
    String? userId, {
    int? workoutDays,
  }) {
    _firebaseFirestore.collection("users").doc(userId).update({
      "workoutDays": workoutDays,
    });
  }

  updateAge(
    String? userId, {
    int? age,
  }) {
    _firebaseFirestore.collection("users").doc(userId).update({
      "age": age,
    });
  }

  updateWeight(
    String? userId, {
    int? weight,
  }) {
    _firebaseFirestore.collection("users").doc(userId).update({
      "weight": weight,
    });
  }

  updateHeight(
    String? userId, {
    int? height,
  }) {
    _firebaseFirestore.collection("users").doc(userId).update({
      "height": height,
    });
  }

  updatePaidMmeber(
    String? userId, {
    bool? paidMember,
  }) {
    _firebaseFirestore.collection("users").doc(userId).update({
      "paidMember": paidMember,
    });
  }

  updateSelectedDiet(
    String? userId, {
    String? selectedDiet,
  }) {
    _firebaseFirestore.collection("users").doc(userId).update({
      "selectedDiet": selectedDiet,
    });
  }

  Future<List<AppUsers?>> discoverSearchUser(String word) async {
    QuerySnapshot snapshot = await _firebaseFirestore
        .collection("users")
        .where("username", isGreaterThanOrEqualTo: word)
        .get();
    List<AppUsers?> users =
        snapshot.docs.map((doc) => AppUsers.fromDocument(doc)).toList();
    return users;
  }
}

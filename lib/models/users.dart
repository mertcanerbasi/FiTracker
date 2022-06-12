import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppUsers {
  final String? id;
  final String? userName;
  final String? fotoUrl;
  final String? email;
  final bool? programCreated;
  final String? gender;
  final String? experience;
  final String? objective;
  final int? workoutDays;
  final int? age;
  final int? weight;
  final int? height;
  final bool? paidMember;
  final String? selectedDiet;

  AppUsers(
      {this.id,
      this.userName,
      this.fotoUrl,
      this.email,
      this.programCreated,
      this.gender,
      this.experience,
      this.objective,
      this.workoutDays,
      this.age,
      this.weight,
      this.height,
      this.paidMember,
      this.selectedDiet});

  factory AppUsers.fromFirebase(User user) {
    return AppUsers(
      id: user.uid,
      userName: user.displayName,
      fotoUrl: user.photoURL,
      email: user.email,
    );
  }

  factory AppUsers.fromDocument(DocumentSnapshot doc) {
    return AppUsers(
      id: doc.id,
      userName: doc['username'],
      fotoUrl: doc['photoUrl'],
      email: doc['email'],
      programCreated: doc['programCreated'],
      gender: doc['gender'],
      experience: doc['experience'],
      objective: doc['objective'],
      workoutDays: doc['workoutDays'],
      age: doc['age'],
      weight: doc['weight'],
      height: doc['height'],
      paidMember: doc['paidMember'],
      selectedDiet: doc['selectedDiet'],
    );
  }
}

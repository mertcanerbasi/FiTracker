// ignore_for_file: unnecessary_this

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/users.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AppUsers? activeUser;
  String? activeUserId;

  Stream<AppUsers?> get stateControl {
    return _firebaseAuth.authStateChanges().map(_createUser);
  }

  Future<AppUsers?> signupWithMail(String email, String password) async {
    var result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return _createUser(result.user);
  }

  signOut() {
    return _firebaseAuth.signOut();
  }

  Future<AppUsers?> setActiveUser() async {
    this.activeUser = await FireStoreService().searchUser(activeUserId);
    notifyListeners();
    return activeUser;
  }

  Future<AppUsers?> loginWithMail(String email, String password) async {
    var result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    activeUserId = AppUsers.fromFirebase(result.user!).id;
    var user = await FireStoreService().searchUser(activeUserId);
    if (user != null) {
      activeUser = user;
      return activeUser;
    } else {
      activeUser = AppUsers.fromFirebase(result.user!);
      return _createUser(result.user);
    }
  }

  AppUsers? _createUser(User? user) {
    return user == null ? null : AppUsers.fromFirebase(user);
  }

  Future<AppUsers?> loginWithGoogle() async {
    GoogleSignInAccount? googleAccount =
        await GoogleSignIn(scopes: ['profile', 'email']).signIn();
    GoogleSignInAuthentication? googleAuthentication =
        await googleAccount!.authentication;
    AuthCredential? authCreds = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken);
    UserCredential userCreds =
        await _firebaseAuth.signInWithCredential(authCreds);
    activeUserId = AppUsers.fromFirebase(userCreds.user!).id;
    var user = await FireStoreService().searchUser(activeUserId);
    if (user != null) {
      activeUser = user;
      return activeUser;
    } else {
      activeUser = AppUsers.fromFirebase(userCreds.user!);
      return _createUser(userCreds.user);
    }
  }

  Future<void> resetPassword(String? email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: "$email");
  }
}

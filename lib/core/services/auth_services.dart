import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthServices> authServices = ValueNotifier(AuthServices());

class AuthServices {
  // Provides access to Firebase Authentication services
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // Returns the currently authenticated user.
  User? get currentUser => firebaseAuth.currentUser;
  // Listens for authentication state changes in real time.
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // signin function
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // signup
  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // signout
  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }

  // reset pass
  Future<void> resetPassword({required String email}) async {
    return await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // update username
  Future<void> updateUsername({required String displayName}) async {
    return await currentUser!.updateDisplayName(displayName); // ?    !
  }

  // delete Account
  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );

    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.delete();
    await firebaseAuth.signOut();
  }

  // reset password from current password
  Future<void> resetPasswordFromCurrentPassword({
    required String email,
    required String password,
    required String newPassword,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );

    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newPassword);
  }
}

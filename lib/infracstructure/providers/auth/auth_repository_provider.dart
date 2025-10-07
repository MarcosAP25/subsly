import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsly/infracstructure/providers/auth/firebase_auth_provider.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  AuthRepository(this._firebaseAuth); 

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found'){
        throw Exception('No user found for that email.');
      } else if(e.code == 'wrong-password'){
        throw Exception('Wrong password provided for that user.');
      } else {
        throw Exception('Failed to sign in: ${e.message}');
      }
    }
  }

  Future <void> signOut() async {
    await _firebaseAuth.signOut();
  }
}


final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return AuthRepository(firebaseAuth);
});
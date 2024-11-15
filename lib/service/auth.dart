import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Kullanıcı kayıt
  Future<void> createUser(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Giriş yapma
  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Çıkış yapma
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      print('Başarıyla çıkış yapıldı.');
    } catch (e) {
      print('Çıkış yaparken hata: ${e.toString()}');
      rethrow; // Hatanın yakalanabilmesi için tekrar fırlatıyoruz
    }
  }
}

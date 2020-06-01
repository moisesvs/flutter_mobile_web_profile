import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseUser user;
  FirebaseApp _app;
  final FirebaseOptions options = const FirebaseOptions(
    googleAppID: '1:1030064810045:ios:0c177507b014120747e254',
    gcmSenderID: '1030064810045',
    apiKey: 'AIzaSyBKAzXhOTSYedBclcfabLrlycUNWnUWXrU',
  );
  get app => _app;

  AuthRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> configure() async {
    _app = await FirebaseApp.configure(
      name: "moisespersonalpage",
      options: options,
    );
    print('Configured $_app');
  }

  Future<AuthResult> signInWithCredentials({String email, String password}) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp({String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut()
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }
  
  Future<FirebaseUser> getUser() async {
    return await _firebaseAuth.currentUser();
  }

  Future<FirebaseUser> updateProfile() async {
    FirebaseUser user = await getUser();
    if (user != null) {
      UserUpdateInfo profileUpdates = new UserUpdateInfo();
      profileUpdates.displayName = "Moisés Vazquez Sánchez";
      profileUpdates.photoUrl = "https://pbs.twimg.com/profile_images/1252188486070874112/7dythvDW_400x400.jpg";
      print("User profile updated!");
      await user.updateProfile(profileUpdates);
    }

    return await getUser();
  }

}
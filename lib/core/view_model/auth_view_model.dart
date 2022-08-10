import 'package:e_commerce/core/services/firestore_user.dart';
import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  Rxn<User?> _user = Rxn<User>();
  final LocalStorageData localStorageData = Get.find();

  //if there is an email with value or not
  get user => _user.value?.email!;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  String? email, password, name;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //make a stream on authentication
    //when there is a change in _auth ,make an update on _auth value
    //error in ? because of null safety :)
    user?.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null){getCurrentUserData(_auth.currentUser!.uid);}
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication? googleSignInAuthentication =
    await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await _auth.signInWithCredential(credential);
  }

  void facebookSignInMethod() async {
    //change : logIn([email])=>logIn()
    FacebookLoginResult result = await _facebookLogin.logIn();
    final accessToken = result.accessToken!.token;
    //change : FacebookLoginStatus.loggedIn => FacebookLoginStatus.success
    if (result.status == FacebookLoginStatus.success) {
      final faceCredential = FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(faceCredential);
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
       getCurrentUserData(value.user!.uid);
      }).then((value) => print(value));
      Get.offAll(HomeView());
    } catch (e) {
      print(e);
      Get.snackbar('Error login account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        await FireStoreUser().addUserToFirestore(UserModel(
            userId: user.user!.uid,
            name: name,
            picture: '',
            email: user.user!.email));
      });
      Get.offAll(HomeView());
    } catch (e) {
      print(e);
      Get.snackbar('Error login account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
        userId: user.user!.uid,
        email: user.user!.email,
        picture: '',
        name: name == null ? user.user!.displayName : name);
    await FireStoreUser().addUserToFirestore(userModel);
    setUser(userModel);
  }

  void getCurrentUserData(String uid) async{
    await FireStoreUser()
        .getCurrentUser(uid)
        .then((value) => {setUser(UserModel.fromJson(value.data() as Map))});
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}

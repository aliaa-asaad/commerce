import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthViewModel extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
GoogleSignIn _googleSignIn =GoogleSignIn(scopes: ['email']);
FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
void GoogleSignInMethod ()async{
  final GoogleSignInAccount? googleUser=await _googleSignIn.signIn();}
}
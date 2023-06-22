import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/login/signIn.dart';
import 'package:example/test2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FocusNode _nicknameFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _nicknameFocusNode.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nicknameFocusNode.unfocus();
        _usernameFocusNode.unfocus();
        _passwordFocusNode.unfocus();
      },
        child: Scaffold(
          backgroundColor: Colors.green,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: Text(
                    "Seize The Day",
                    style: TextStyle(
                      fontFamily: 'legendday',
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 42,
                child: TextField(
                  controller: _nicknameController,
                  focusNode: _nicknameFocusNode,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: "닉네임",
                    contentPadding: const EdgeInsets.only(left: 10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 42,
                child: TextField(
                  controller: _usernameController,
                  focusNode: _usernameFocusNode,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: "아이디",
                    contentPadding: const EdgeInsets.only(left: 10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 42,
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: "비밀번호",
                    contentPadding: const EdgeInsets.only(left: 10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {
                    signUp(context, _nicknameController.text, _usernameController.text, _passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "화원가입하기",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 23.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()),
                            (route) => false);
                      },
                      child: const Text(
                        "로그인",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
    );
  }

  void signUp(context, String nickname, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // 회원가입 성공

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'nickname': nickname,
          'username': email,
          'uid': userCredential.user!.uid,
        });

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Test2()),
              (route) => false,
        );
      }
    } catch (e) {
      // 회원가입 실패
      print('회원가입 오류: $e');
    }
  }

}

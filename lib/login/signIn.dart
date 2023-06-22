import 'package:example/login/signUp.dart';
import 'package:example/test2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwrodController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                  padding: EdgeInsets.only(bottom: 100.0),
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
                  controller: _userNameController,
                  focusNode: _usernameFocusNode,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff896E50)),
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
                  controller: _passwrodController,
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff896E50)),
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
                    _signInWithEmailAndPassword(context, _userNameController.text, _passwrodController.text); // 이메일로 로그인 함수 호출
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff896E50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "로그인하기",
                    style: TextStyle(color: Colors.white),
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
                                builder: (context) => const SignUpPage()),
                            (route) => false);
                      },
                      child: const Text(
                        "회원가입",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      );
  }
  void _signInWithEmailAndPassword(context, String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;
      if (user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Test2()),
              (route) => false,
        );
      }
    } catch (e) {
      // 로그인 실패
      print('로그인 오류: $e');
    }
  }
}

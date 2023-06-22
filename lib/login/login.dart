import 'package:example/homePage.dart';
import 'package:example/login/signIn.dart';
import 'package:example/login/signUp.dart';
import 'package:example/mainPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
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
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 230.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignInPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          "로그인하기",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 13,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            // side: const BorderSide(
                            //   color: Color(0xff896E50),
                            // ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          "회원가입하기",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    ElevatedButton(onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainPage()), (route) => false);}, child: Text("순간이동", )),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}

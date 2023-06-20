import 'package:example/mainPage.dart';
import 'package:example/model/questionList.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff72D88F),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "자가진단테스트",
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Center(
              child: Card(
                elevation: 6,
                color: Colors.white,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        index < QuestionList().questionList.length ? Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            QuestionList().questionList[index],
                            style: const TextStyle(fontSize: 20),
                          ),
                        ) : const Text("테스트가 끝났습니다!\n감사합니다", style: TextStyle(fontSize: 20),),
                        const SizedBox(
                          height: 40,
                        ),
                        index < QuestionList().questionList.length ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  index++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  index++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffAFE0BD)),
                              child: const Text(
                                "No",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        ): ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const MainPage()),
                                  (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: const Text(
                            "완료",
                            style: TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

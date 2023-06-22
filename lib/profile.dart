import 'package:example/profile.dart';
import 'package:example/statistic.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'homePage.dart';
import 'model/model.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: TextButton(
          child: const Text(
            "Settings",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text("Logout", style: TextStyle(color: Colors.white)))
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Stack(
                  children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Colors.white,
                    ),
                    width: 160,
                    height: 160,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Center(
                    child: Container(
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.asset("./assets/images/profile.png"))),
                  ),
                ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Text("김경록", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          const SizedBox(height: 5,),
          const Text("많이 피곤한 상태", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xffBDBDBD)),),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: ToDoList().toDoList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(ToDoList().toDoList[index][0]),
                      ),
                      LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 50,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent: index == 2 ? 0.33 : index == 1 ? 1.0 : 0.6,
                        center: Text(index == 2 ? "1/3" : index == 1 ? "100.0%" : "60.0%"),
                        // linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.greenAccent,
                      ),
                    ],
                  );
                },
              ),
            ),
          )

        ],
      ),
    );
  }
}

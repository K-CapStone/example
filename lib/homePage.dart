import 'package:example/profile.dart';
import 'package:example/statistic.dart';
import 'package:example/todayDiary.dart';
import 'package:flutter/material.dart';

import 'detailPage.dart';
import 'model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> isCheckedList = List.generate(
    ToDoList().toDoList.length,
    (index) => false,
  );
  final items = ToDoList().toDoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "길라잡이",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ToDayDiary()));
              },
              icon: const Icon(
                Icons.sunny,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Card(
          elevation: 5,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 16, right: 16),
              child: Column(
                children: [
                  const Text(
                    "은둔형 외톨이",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Dismissible(
                          key: Key(item),
                          background: Container(
                            color: Colors.redAccent, // 왼쪽 스와이프 배경색
                            alignment: Alignment.centerLeft,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "포기",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          secondaryBackground: Container(
                            color: Colors.green, // 오른쪽 스와이프 배경색
                            alignment: Alignment.centerRight,
                            child: const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Text(
                                "성공",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              items.removeAt(index);
                            });
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                            title: item,
                                          )));
                            },
                            child: ListTile(
                                title: Row(
                              children: [
                                const Icon(Icons.arrow_forward),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text("${index + 1}. $item"),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.arrow_back),
                              ],
                            )),
                          ),
                        );
                      },
                    ),
                    // ListView.builder(
                    //   itemCount: ToDoList().toDoList.length,
                    //   itemBuilder: (context, index) {
                    //     return ListTile(
                    //       title: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(ToDoList().toDoList[index]),
                    //           Checkbox(
                    //             value: isCheckedList[index],
                    //             onChanged: (bool? value) {
                    //               setState(() {
                    //                 isCheckedList[index] = value ?? false;
                    //               });
                    //             },
                    //           ),
                    //         ],
                    //       ),
                    //     );
                    //   },
                    // )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.create),
      ),
    );
  }
}

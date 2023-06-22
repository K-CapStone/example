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

  Future<Future<bool?>> showConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: 250,
            height: 230,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "포기 하시겠습니까?",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text(
                          "취소",
                          style: TextStyle(color: Colors.green, fontSize: 17),
                        ),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text(
                          "확인",
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  int count = 0;
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
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: items.isNotEmpty ? ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Dismissible(
                          key: Key(item[0]),
                          confirmDismiss: (direction) async {
                            if (direction == DismissDirection.startToEnd) {
                              final result =
                                  await showConfirmationDialog(context);

                              if (result == true) {
                                // 항목 삭제 로직을 여기에 구현
                              }

                              return result;
                            } else if (direction ==
                                DismissDirection.endToStart) {
                              const result = true;

                              return result;
                            }
                          },
                          background: Container(
                            color: Colors.redAccent,
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
                            color: Colors.green,
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
                            if (direction == DismissDirection.endToStart) {
                              var snackBar = SnackBar(
                                content: Text('${item[0]} 성공!'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              setState(() {
                                final currentItem = items[index];
                                if (currentItem.length >= 2) {
                                  for (int i = 0;
                                      i < currentItem.length - 1;
                                      i++) {
                                    currentItem[i] = currentItem[i + 1];
                                  }
                                  final updatedText = currentItem[0];
                                  items[index][0] = updatedText;
                                  currentItem.length--;
                                } else {
                                  setState(() {
                                    items.removeAt(index);
                                  });
                                }
                              });
                            } else {
                              setState(() {
                                items.removeAt(index);
                              });
                            }
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                            title: item[0],
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
                                      Text("${index + 1}. ${item[0]}"),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.arrow_back),
                              ],
                            )),
                          ),
                        );
                      },
                    ) : const Center(child: Padding(
                      padding: EdgeInsets.only(bottom: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("오늘 미션을 모두 끝내셨네여!", style: TextStyle(fontSize: 20),),
                          Text("수고하셨습니다!", style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    )),
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

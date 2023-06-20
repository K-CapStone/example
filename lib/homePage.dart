import 'package:example/profile.dart';
import 'package:example/statistic.dart';
import 'package:flutter/material.dart';

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
                        itemCount: ToDoList().toDoList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(ToDoList().toDoList[index]),
                                Checkbox(
                                  value: isCheckedList[index],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isCheckedList[index] = value ?? false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Icon(Icons.create),
      ),
    );
  }
}

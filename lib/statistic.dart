import 'dart:math';

import 'package:example/model/criteria.dart';
import 'package:flutter/material.dart';
import 'package:radar_chart/radar_chart.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class Statistic extends StatefulWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  final int _length = 6;
  List<double> values1 = [0.4, 0.8, 0.65, 0.5, 0.2, 0.4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Statistic",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(top: 15.0, left: 20.0, right: 8.0),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: Criteria().criteria.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SimpleAnimationProgressBar(
                                    height: 200,
                                    width: 30,
                                    backgroundColor: const Color(0xffF0F0F0),
                                    foregrondColor: Colors.purple,
                                    ratio: index == 0
                                        ? 0.1
                                        : index == 1
                                        ? 0.2
                                        : index == 2
                                        ? 0.3
                                        : index == 3
                                        ? 0.4
                                        : index == 4
                                        ? 0.5
                                        : 0.6,
                                    direction: Axis.vertical,
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    duration: const Duration(seconds: 3),
                                    borderRadius: BorderRadius.circular(10),
                                    gradientColor: const LinearGradient(
                                        colors: [Colors.greenAccent, Colors.green],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    Criteria().criteria[index],
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "List",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Criteria().criteria.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Criteria().criteria[index],
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const Text("3개 달성"),
                              ],
                            ),
                            const Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 600,
                        height: 400,
                        color: Colors.grey.shade300,
                      ),
                      Container(
                        width: 400,
                        height: 400,
                        child: Center(
                          child: RadarChart(
                            length: _length,
                            radius: 150,
                            initialAngle: pi / 6,
                            backgroundColor: Colors.white,
                            //borderStroke: 2,
                            //borderColor: Colors.red.withOpacity(0.4),
                            radialStroke: 2,
                            radialColor: Colors.grey.shade300,
                            radars: [
                              RadarTile(
                                values: values1,
                                borderStroke: 2,
                                borderColor: Colors.greenAccent,
                                backgroundColor: Colors.greenAccent.withOpacity(0.4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//stack으로 차트에 데이터 추가 가능
import 'package:flutter/material.dart';

class Boxapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('2 Column'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      if (index % 2 == 0) {
                        return GestureDetector(
                          onTap: () {
                            print('This is $index no index');
                          },
                          child: Container(
                            height: 100,
                            color: Colors.blue,
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Center(child: Text('1 Box $index')),
                          ),
                        );
                      } else {
                        return Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  print('This is $index no index');
                                },
                                child: Container(
                                  height: 100,
                                  color: Colors.red,
                                  margin: const EdgeInsets.only(right: 4, bottom: 8),
                                  child: Center(child: Text('2 Box $index')),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  print('This is $index no index');
                                },
                                child: Container(
                                  height: 100,
                                  color: Colors.green,
                                  margin: const EdgeInsets.only(left: 4, bottom: 8),
                                  child: Center(child: Text('3 Box $index')),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      if (index % 2 == 0) {
                        return GestureDetector(
                          onTap: () {
                            print('This is $index no index');
                          },
                          child: Container(
                            height: 100,
                            color: Colors.orange,
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Center(child: Text('1 Box ${index ~/ 2 + 1}')),
                          ),
                        );
                      } else {
                        return Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  print('This is $index no index');
                                },
                                child: Container(
                                  height: 100,
                                  color: Colors.purple,
                                  margin: const EdgeInsets.only(right: 4, bottom: 8),
                                  child: const Center(child: Text('Box 1')),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  print('This is $index no index');
                                },
                                child: Container(
                                  height: 100,
                                  color: Colors.yellow,
                                  margin: const EdgeInsets.only(left: 4, bottom: 8),
                                  child: const Center(child: Text('Box 2')),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


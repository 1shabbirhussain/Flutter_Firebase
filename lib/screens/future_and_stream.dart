import 'package:flutter/material.dart';

class futureAndStream extends StatefulWidget {
  const futureAndStream({super.key});

  @override
  State<futureAndStream> createState() => _futureAndStreamState();
}

class _futureAndStreamState extends State<futureAndStream> {
  // -----------------------future builder---------------
  Future<int> future(int number) async {
    await Future.delayed(Duration(seconds: 4));
    return number + number;
  }

  // ------------------------ stream builder---------------------
  Stream<int> stream(int number) async* {
    while (number <= 10) {
      await Future.delayed(Duration(seconds: 1));
      yield number++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: future(10),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Future Builder: ${snapshot.data}",
                    style: TextStyle(fontSize: 30),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            SizedBox(
              height: 10,
            ),
            StreamBuilder(
              stream: stream(0),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Stream Builder: ${snapshot.data}",
                    style: TextStyle(fontSize: 30),
                  );
                }
                return CircularProgressIndicator(
                  color: Colors.yellow,
                );
              },
            )
          ],
        ),
      ),
    ));
  }
}

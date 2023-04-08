import 'package:flutter/material.dart';

import 'frontend/gamePage.dart';

class StartScreen extends StatelessWidget {
  //const StartScreen({super.key});
  StartScreen({super.key});
  final TextEditingController _textFieldController = TextEditingController();

  Future _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Enter room code below"),
              content: TextField(
                controller: _textFieldController,
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: "somecrap@killersudoku"),
              ),
              actions: <Widget>[
                MaterialButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: const Text('Submit'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameScreen()),
                    );
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suduko (The killer kind)'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Join a room'),
                onPressed: () async {
                  await _displayDialog(context);

                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => GameScreen()),
                  //     );
                  //   },
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Continue game'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Start a new game'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameScreen()),
                  );
                },
              ),
            ]),
      ),
    );
  }
}

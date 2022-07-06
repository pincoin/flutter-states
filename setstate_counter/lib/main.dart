import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(_counter, _change),
    );
  }

  void _change(int val) {
    setState(() {
      _counter = _counter + val;
    });
  }
}

class HomeScreen extends StatelessWidget {
  final int counter;
  final void Function(int) change;

  const HomeScreen(this.counter, this.change, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('counter - setState()'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => change(-1),
                    child: const Text(
                      '-',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  counter.toString(),
                  style: const TextStyle(fontSize: 36),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => change(1),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(0),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('counter - Provider'),
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
                    onPressed: () => context.read<Counter>().change(-1),
                    child: const Text(
                      '-',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Selector<Counter, int>(
                  selector: (_, c) => c.count,
                  builder: (_, count, __) {
                    return Text(
                      count.toString(),
                      style: const TextStyle(fontSize: 36),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => context.read<Counter>().change(1),
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

class Counter extends ChangeNotifier {
  int count;

  Counter(this.count);

  void change(int val) {
    // ????????? ?????? ??? ?????? ???????????? ?????????
    count += val;
    // listener, observer, subscriber?????? ??????
    notifyListeners();
  }
}

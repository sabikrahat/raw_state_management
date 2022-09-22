import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// StreamController
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<int> counter = StreamController<int>();

  @override
  void initState() {
    super.initState();
    counter.add(0);
  }

  void incrementCounter(int newVal) => counter.add(newVal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counter.stream,
          builder: (context, snapshot) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${snapshot.data}',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => incrementCounter(snapshot.data! + 1),
                label: const Text('Increment'),
                icon: const Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// // Stream as Timer Preiodic
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int counter = 0;

//   void incrementCounter() => counter++;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: StreamBuilder(
//           stream: Stream.periodic(const Duration(milliseconds: 1)),
//           builder: (context, snapshot) => Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'You have pushed the button this many times:',
//               ),
//               Text(
//                 '$counter',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton.icon(
//                 onPressed: () => incrementCounter(),
//                 label: const Text('Increment'),
//                 icon: const Icon(Icons.add),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

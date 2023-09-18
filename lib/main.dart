import 'package:flutter/material.dart';
import 'package:mobile_declarative_ui/native_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textFromNative = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text.rich(
              TextSpan(
                text: 'Text from the other side::',
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(
                    text: textFromNative,
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () async {
                final data = await navigateToNative();

                setState(() {
                  textFromNative = data;
                });
              },
              child: const Text('Call native code'),
            )
          ],
        ),
      ),
    );
  }
}

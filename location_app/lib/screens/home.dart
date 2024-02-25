import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final sizedbox = const SizedBox(
    height: 20,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Location App"),
        centerTitle: true,
      ),
      body: Column(children: [
        const Text("Are you a:"),
        sizedbox,
        TextButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text("Parent")),
        sizedbox,
        TextButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text("Child"))
      ]),
    ));
  }
}

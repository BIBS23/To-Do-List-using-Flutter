import 'package:flutter/material.dart';

class DotHome extends StatefulWidget {
  const DotHome({Key? key}) : super(key: key);

  @override
  State<DotHome> createState() => _DotHomeState();
}

class _DotHomeState extends State<DotHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(itemBuilder: (BuildContext context, int index) {
      return Card(
        child: Center(child: Text("bigb"),),

      );
    }));
  }
}

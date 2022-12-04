import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();
  String DotText = "";
  List Dot = [];
  CollectionReference DotData = FirebaseFirestore.instance.collection("DO TASK");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
        body: ListView.builder(
          itemCount: Dot.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    child: ListTile(
                        title: Text(Dot[index]),
                        trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            splashRadius: 5,
                            onPressed: () {
                              setState(() {
                                Dot.removeAt(index);
                              });
                            }))));
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        actions: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  DotData.add({"My Task": DotText})
                                      .then((value) => print("Created"));
                                  DotText = _controller.text;

                                  Dot.add(DotText);
                                  Navigator.pop(context);
                                  _controller.clear();
                                });
                              },
                              child: Text("Add",
                                  style: TextStyle(color: Colors.deepPurple))),
                        ],
                        title: Text("Do Task",
                            style: TextStyle(color: Colors.deepPurple)),
                        content: TextField(
                          onChanged: (value) => DotText,
                          controller: _controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 6,
                          ))),
                        ));
                  });
            }));
  }
}

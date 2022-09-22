import 'package:demo/Modaldata.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myapp(),
    ),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController std = TextEditingController();

  List<data> l1 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ShowAlertDialog(context);
        },
      ),
      body: ListView.builder(
        itemCount: l1.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${l1[index].id1}"),
                      Text("${l1[index].name1}"),
                      Text("${l1[index].std1}"),
                      IconButton(onPressed: (){
                        setState(() {
                          l1.removeAt(index);
                        });
                      }, icon:Icon(Icons.delete)),
                    ],
                  ),
                ),

              ),
            ),
          );
        },
      ),
    );
  }

  void ShowAlertDialog(context) {
    AlertDialog alertDialog = AlertDialog(
      title: Column(
        children: [
          TextField(
            controller: id,
            decoration: InputDecoration(
              labelText: "ID",
              hintText: "Enter your id",
            ),
          ),
          TextField(
            controller: name,
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Enter your Name",
            ),
          ),
          TextField(
            controller: std,
            decoration: InputDecoration(
              labelText: "Std",
              hintText: "Enter your Std",
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
           setState(() {
             l1.add(data(id.text, name.text, std.text));
           });
          },
          child: Text("OK"),
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }
}

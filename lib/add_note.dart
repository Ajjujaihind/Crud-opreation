import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New Note"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: "Enter Title",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              SizedBox(
                height: 10,
              ),
              TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: "Enter Message",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Save"))
            ],
          ),
        ));
  }
}

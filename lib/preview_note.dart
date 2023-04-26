import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PreviewNote extends StatelessWidget {
  var titlecontroller = TextEditingController();
  var messagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Preview Note")),
        actions: [
          InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        width: 100,
                        height: 400,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                                controller: titlecontroller,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    hintText: "Enter Title",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                                controller: messagecontroller,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    hintText: "Enter Message",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: Text("Update"))
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50))),
                      );
                    });
              },
              child: Icon(Icons.edit))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Title",
            style: TextStyle(fontSize: 35),
          ),
          Text("Message"),
        ],
      ),
    );
  }
}

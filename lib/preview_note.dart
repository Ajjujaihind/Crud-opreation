import 'package:crud/db_helper.dart';
import 'package:crud/home_page.dart';
import 'package:flutter/material.dart';

class PreviewNote extends StatefulWidget {
  @override
  State<PreviewNote> createState() => _PreviewNoteState();
  var noteId;
  var Title;
  var Desc;

  PreviewNote(this.noteId, this.Title, this.Desc);
}

class _PreviewNoteState extends State<PreviewNote> {
  List<Map<String, dynamic>> Previewgetnote = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                titlecontroller.text = widget.Title;
                messagecontroller.text = widget.Desc;
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
                                onPressed: () {
                                  var id = widget.noteId;
                                  var title = titlecontroller.text.toString();
                                  var desc = messagecontroller.text.toString();
                                  Dbhelper().updatData(id, title, desc);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => HomePage())));
                                },
                                child: Text("Update"))
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
            "${widget.Title}",
            style: TextStyle(fontSize: 35),
          ),
          Text("${widget.Desc}"),
        ],
      ),
    );
  }
}

import 'package:crud/add_note.dart';
import 'package:crud/db_helper.dart';
import 'package:crud/preview_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getnote();
  }

  void getnote() async {
    notes = await Dbhelper().fetchdata();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNote()));
        },
      ),
      appBar: AppBar(
        title: Center(child: Text("Home")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: notes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 4, crossAxisSpacing: 4, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PreviewNote(
                            notes[index][Dbhelper().columnId],
                            notes[index][Dbhelper().columnTitle],
                            notes[index][Dbhelper().columnDesc])));
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Delet Note"),
                      content: Text("Do u wanna delete "),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Dbhelper().deletenote(
                                  notes[index][Dbhelper().columnId]);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ));
                            },
                            child: Text("Delete")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancle"))
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(notes[index][Dbhelper().columnId].toString()),
                      Text(notes[index][Dbhelper().columnTitle]),
                      Text(notes[index][Dbhelper().columnDesc]),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

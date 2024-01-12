import 'package:flutter/material.dart';
import 'package:simplified_note_app/view/new_input_page.dart';
import 'package:simplified_note_app/model/note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];
  List<Note> searchNotes = [];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchNotes = notes;
  }
  void deleteNote(int index) {
    setState(() {
      Note note = notes[index];
      searchNotes.remove(note);
    });
  }

  void searchNote(String searchText) {
    setState(() {
      searchNotes = notes
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'To Do List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.sort,
                    size: 45,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (String searchText) {
                searchNote(searchText);
              },
              style: TextStyle(
                fontSize: 25,
                color: Colors.white60,
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 25,
                ),
                fillColor: Colors.grey.shade700,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(40),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.transparent)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchNotes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: RichText(
                          text: TextSpan(
                            text: '${searchNotes[index].title}\n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                            children: [
                              TextSpan(
                                text: '${searchNotes[index].content}\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          '${searchNotes[index].date}',
                          style: TextStyle(
                            color: Colors.grey.shade800,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteNote(index);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewInputPage()),
          );
          if (result != null) {
            setState(() {
              notes.add(Note(
                  id: notes.length,
                  title: result[0],
                  content: result[1],
                  date: DateTime.now()));
            });
          }
        },
        icon: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}

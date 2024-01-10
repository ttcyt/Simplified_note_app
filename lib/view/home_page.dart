import 'package:flutter/material.dart';
import 'package:simplified_note_app/view/new_input_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 2;

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
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: RichText(
                    text: TextSpan(
                      text: 'Title\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                      children: [
                        TextSpan(
                          text: 'content\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Text(
                    'date:2022/10/29',
                    style: TextStyle(color: Colors.grey.shade800,),
                  ),
                  trailing: Icon(Icons.delete),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewInputPage()),
          );
        },
        icon: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}

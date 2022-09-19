import 'package:breadtalking/model/bread.dart';
import 'package:breadtalking/model/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  Bread bread;
  String username;
  int breadIndex;

  DetailPage({ super.key, required this.bread, required this.username, required this.breadIndex});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  TextEditingController commentController = TextEditingController();

  List<Comment> comments = []; 

  
  late Comment currComment = comments[widget.breadIndex];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(comments.isEmpty){
      comments.add(Comment(username: [], comment: []));
      comments.add(Comment(username: [], comment: []));
      comments.add(Comment(username: [], comment: []));
      comments.add(Comment(username: [], comment: []));
      comments.add(Comment(username: [], comment: []));
    }
  }

  void handleComment(){
    String userComment = commentController.text;

    if(userComment.isEmpty){
      showDialog(context: context, builder: ((context) {
        return AlertDialog(
          title: const Text("Error",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red
          ),
          ),
          content: const Text("Comment Must not be Empty!"),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, 
            child: const Text("Back"))
          ],
        );
      }));
      return;
    }

    setState(() {
      currComment.username.add(widget.username);
      currComment.comment.add(userComment);

      ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text("Comment Successfully added!")));
      commentController.clear();
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/BreadTalk_logo.png", width:100,),
          backgroundColor: Colors.black,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Detail",
                icon: Icon(Icons.breakfast_dining),
              ),
              Tab(
                text: "Comments",
                icon: Icon(Icons.message),
              )
            ]
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(widget.bread.image, width: 300,),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Text("Name: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("${widget.bread.name}",
                      style: const TextStyle(
                        fontSize: 20,
                      ))
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Text("Price: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("${widget.bread.price.toString()}\$",
                      style: const TextStyle(
                        fontSize: 20,
                      ))
                    ),
                  ],
                ),
                
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("Description",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                  textAlign: TextAlign.center,),
                ),
                Padding(
                padding: const EdgeInsets.all(10),
                child: Text("${widget.bread.description}\$",
                style: const TextStyle(
                  fontSize: 15
                ),
                textAlign: TextAlign.center,)
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text("Comment",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                  textAlign: TextAlign.center,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: TextField(
                    controller: commentController,
                    decoration: const InputDecoration(hintText: "Give Comment"),
                ),),
                Padding(
                padding: const EdgeInsets.only(top: 5, left: 40, right: 40),
                child: ElevatedButton(
                  onPressed: handleComment, 
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text("Submit",
                      style: TextStyle(
                        fontSize: 20
                      ),
                  ),
                  
                ),)
              ],
            ),
            ListView.builder(
              itemCount: currComment.comment.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20) ,
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${currComment.username[index]}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                        Text("${currComment.comment[index]}")
                      ],
                    ),
                    )
                );
              },
            )
          ]
        ),
      )
    );
  }
}
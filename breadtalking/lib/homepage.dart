import 'package:breadtalking/itemspage.dart';
import 'package:breadtalking/loginpage.dart';
import 'package:breadtalking/provider/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  String username;
  String email;
  String password;
  HomePage({super.key, required this.username, required this.email, required this.password});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listBread = ["assets/fiveblessing.png", "assets/singashake.png", "assets/circleoflife.png", "assets/firstlove.png", "assets/ahlemak.png"];



  Icon themeIcon = const Icon(Icons.light_mode);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(
                                                    context,
                                                    listen: false);
    var userDisplay = widget.username;
    
    setState(() {
      if(themeProvider.getTheme == themeProvider.dark){
        themeIcon = const Icon(Icons.dark_mode);
      } else {
        themeIcon = const Icon(Icons.light_mode);
      }

      if(widget.username.length > 5){
        userDisplay = widget.username.substring(0,5);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: [
              Image.asset("assets/BreadTalk_logo.png", width:100,),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                child: Text("welcome " + userDisplay + "!",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14
                    ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: ElevatedButton(
                  onPressed: (() {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) {
                      return LoginPage(username: widget.username, email: widget.email, password: widget.password,);
                    })), ((route) => false));
                  }), 
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: const Size(70, 5),
                    padding: const EdgeInsets.all(2)
                  ),
                  child: const Text("logout",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12
                    ),)
                ),
              ),
              
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text( widget.username ,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.apps),
                title: const Text("Bread List"),
                onTap: (() {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) {
                    return ItemPage(username: widget.username, email: widget.email, password: widget.password,);
                  }), (route) => false,);
                }),
              ) ,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => themeProvider.swapTheme(),
        child: themeIcon,
        backgroundColor: themeProvider.getTheme == themeProvider.light ? Colors.black : Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CarouselSlider(
              items: listBread.map((el) => Image.asset(el)).toList(), 
              options: CarouselOptions(
                aspectRatio: 16/9,
                initialPage: 0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5)
              )),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("About Us",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Text("A staple in the diet of many in Asia, BreadTalking honours the art of bread-making by giving life to their novel creations since its inception. In the continual process of creativity and innovation, BreadTalking's evolution and growth as an internationally recognized bakery brand over the last 16 years has been encapsulated through four distinctive Generations. BreadTalking's new concept aims to immerse consumers in a unique experience that harkens back to enjoying natural goodness and the bliss of great-tasting breads. ",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                    ),
            ),
            
          ]
        ),
      ),
    );
  }
}
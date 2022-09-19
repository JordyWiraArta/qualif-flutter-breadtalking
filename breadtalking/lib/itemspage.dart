import 'dart:ffi';

import 'package:breadtalking/detailpage.dart';
import 'package:breadtalking/homepage.dart';
import 'package:breadtalking/model/bread.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  String username;
  String email;
  String password;
  ItemPage({ super.key, required this.username, required this.email, required this.password});

  @override
  _ItemPageState createState() => _ItemPageState();
}



class _ItemPageState extends State<ItemPage> {

  var breads = [
    Bread(name: "Five Blessing", image: "assets/fiveblessing.png", price: 5, description: "A healthful mix of red quinoa, red rice yeast, flaxseed and more; Five Blessings is loaded with highly nutritional ingredients to make it a tasty blessing of longevity, prosperity, health, virtue and good living!"),
    Bread(name: "First Love", image: "assets/firstlove.png", price: 7, description: "Pretty on the outside and just as lovely inside! This blushing bo-luo brioche is filled with rose petal blended strawberry jam, giving it a delicately sweet taste and a beautiful aroma. It’s definitely love at first bite!"),
    Bread(name: "Circle of Life", image: "assets/circleoflife.png", price: 6, description: "Life comes full circle with this wholesome longan walnut brioche! Dusted with roasted pistachios, the added crunch will remind you that life’s rocky roads can be surmounted with the sweet taste of success."),
    Bread(name: "Singa Shake", image: "assets/singashake.png", price: 5, description: "The coconut reimagined! Filled with smooth coconut custard and topped with Singaporeans’ favourite kaya spread, this tropical shake is perfect for sunny Singapore."),
    Bread(name: "Ah Lemak", image: "assets/ahlemak.png", price: 4, description: "Who doesn’t enjoy a plate of shiok nasi lemak? Now in a bun, the spiciness of ikan bilis and peanut sambal flavourfully enriched with melted cheese is a must must try!")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/BreadTalk_logo.png", width:100,),
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
                leading: const Icon(Icons.home),
                title: const Text("Back to Home"),
                onTap: (() {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) {
                    return HomePage(username: widget.username, email: widget.email, password: widget.password,);
                  }), (route) => false,);
                }),
              ) ,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text("Here is our list of bread!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
          ),
          Expanded(
            child:  ListView.builder(
              itemCount: breads.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Column(
                        children: [
                          Text(breads[index].name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                          Image.asset(breads[index].image, width: 300,),
                          Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text("${breads[index].price.toString()}\$",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),)
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: ElevatedButton(
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return DetailPage(bread: breads[index], username: widget.username, breadIndex: index,);
                              },)), 
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.orange
                              ),
                              child: const Text("See more Detail",
                                  style: TextStyle(
                                    fontSize: 20
                                  ),
                              ),
                              
                          ),)
                        ],
                    )
                  );
              },
            
            ),
          )
        ],
      )
    );
  }
}
import 'package:breadtalking/homepage.dart';
import 'package:breadtalking/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  String username;
  String email;
  String password;
  LoginPage({ super.key, required this.username, required this.email, required this.password});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleLogin(){
    String email = emailController.text;
    String password = passwordController.text;

    if(email.isEmpty || password.isEmpty){
      showDialog(context: context, builder: ((context) {
        return AlertDialog(
          title: const Text("Error",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red
          ),),
          content: const Text("Please Fill all the blanks!"),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, 
            child: const Text("Back"))
          ],
        );
      }));
      return;
    } else if(!email.endsWith("@gmail.com")){
      showDialog(context: context, builder: ((context) {
        return AlertDialog(
          title: const Text("Error",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red
          ),),
          content: const Text("Email must ends with @gmail.com!"),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, 
            child: const Text("Back"))
          ],
        );
      }));
      return;
    } else if(email.split("@").length > 2){
      showDialog(context: context, builder: ((context) {
        return AlertDialog(
          title: const Text("Error",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red
          ),),
          content: const Text("Email must only have 1 @"),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, 
            child: const Text("Back"))
          ],
        );
      }));
      return;
    } else if(email != widget.email){
      showDialog(context: context, builder: ((context) {
        return AlertDialog(
          title: const Text("Error",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red
          ),),
          content: const Text("Email is not match with registered email!"),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, 
            child: const Text("Back"))
          ],
        );
      }));
      return;
    } else if(password != widget.password){
      showDialog(context: context, builder: ((context) {
        return AlertDialog(
          title: const Text("Error",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red
          ),),
          content: const Text("Password invalid!"),
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

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) {
      return HomePage(username: widget.username, password: password, email: email,);
    })), ((route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/BreadTalk_logo.png", width: 100,),
        backgroundColor: Colors.black,
        foregroundColor: Colors.orange,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(5), 
                child: Text("Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 2,
                  fontSize: 30,
                ),) ,
              ),
              Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: "email"),
              ),),
              Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: "password"),
                obscureText: true,
                
              ),),
              Padding(
              padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: ElevatedButton(
                onPressed: handleLogin, 
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: const Size(120, 50)
                ),
                child: const Text("Login",
                    style: TextStyle(
                      fontSize: 20
                    ),
                ),
                
              ),),
              Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisterPage();
                  },));
                }, 
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black,
                  fixedSize: const Size(120, 50)
                ),
                child: const Text("Register",
                    style: TextStyle(
                      fontSize: 20
                    ),
                ),
                
              ),)
              
            ]
          ),
      ),

    );
  }
}
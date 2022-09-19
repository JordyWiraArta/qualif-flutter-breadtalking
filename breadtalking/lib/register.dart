import 'package:breadtalking/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  void handleRegis(){
    String email = emailController.text;
    String password = passwordController.text;
    String username = usernameController.text;

    if(email.isEmpty || password.isEmpty || username.isEmpty){
      showDialog(context: context, builder: ((context) {
        return AlertDialog(
          title: const Text("Error"),
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
          title: const Text("Error"),
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
    } else if(username.length < 3){
      showDialog(context: context, builder: ((context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("Please input username with more than 3 characters"),
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
      return LoginPage(username: username, email: email, password: password,);
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
                child: Text("Register",
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
                controller: usernameController,
                decoration: const InputDecoration(hintText: "username"),
                
              ),),
              Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: "password"),
                obscureText: true,
                
              ),),
              Padding(
              padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: ElevatedButton(
                onPressed: handleRegis, 
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black,
                  fixedSize: const Size(120, 50)
                ),
                child: const Text("Regis",
                    style: TextStyle(
                      fontSize: 20
                    ),
                ),
                
              ),),
             
              
            ]
          ),
      ),

    );
  }
}
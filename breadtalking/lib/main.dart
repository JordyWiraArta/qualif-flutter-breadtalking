
import 'package:breadtalking/loginpage.dart';
import 'package:breadtalking/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {

  return runApp(
    ChangeNotifierProvider(
      child: const BreadTalking(),
      create: (BuildContext context) => ThemeProvider(false),
    )
    );
}

class BreadTalking extends StatefulWidget {
  const BreadTalking({ Key? key }) : super(key: key);

  @override
  State<BreadTalking> createState() => _BreadTalkingState();
}

class _BreadTalkingState extends State<BreadTalking> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
            title: "BreadTalking",
            theme: themeProvider.getTheme,
            home: LoginPage(username: "", email: "", password: "",),
          );
      },
    );
  }
}
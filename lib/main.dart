import 'package:flutter/material.dart';
import 'package:miniproject/common.dart';
import 'package:miniproject/home.dart';
import 'package:miniproject/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const _FirstScreenState());
}

class _FirstScreenState extends StatefulWidget {
  const _FirstScreenState({super.key});

  @override
  State<_FirstScreenState> createState() => __FirstScreenStateState();
}

class __FirstScreenStateState extends State<_FirstScreenState> {
    bool isLogin = false;

    

  Future<void> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final String? username = prefs.getString('username');
    if (username != null) {
      usernameGB = username;
      isLogin = true;
      setState(() {});
    } else {
      isLogin = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    autoLogin();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: isLogin ? HomeScreen() : LoginScreen(),
    );
  }
}
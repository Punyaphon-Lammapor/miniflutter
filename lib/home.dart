import 'package:flutter/material.dart';
import 'package:miniproject/common.dart';
import 'package:miniproject/gridview.dart';
import 'package:miniproject/profilescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexPage = 0;
  int i =0;
  List<Widget> page = [
      const GridViewScreen(),
      
        Container(
        color: Colors.blue,
      ),      
      const profileScreen(),
    ];

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          backgroundColor: Colors.amber,
          title: Text(usernameGB),
          actions: [
            IconButton(onPressed: (){}, 
            icon: const Icon(Icons.notifications)
            )
          ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.amber,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            currentIndex: indexPage,
            onTap: (value){
              indexPage = value;
              i = value;
              setState(() {
                
              });
            },
            items:  const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.menu),label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
            ],
          ),
        body: 
          page[i]
          
          )
          );
  }
}
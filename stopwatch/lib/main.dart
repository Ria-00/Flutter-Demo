import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget{

  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState(); 
  
}

class HomeState extends State<Home>{

  int _page=0;

  // List<Widget> _pages=[HomePage(),SearchPage(),WatchList()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:  Color.fromARGB(238, 106, 15, 15),
          title: Center(child: Text('FITNESS TRACKER',style: TextStyle(color: Color.fromARGB(255, 24, 23, 23),fontWeight: FontWeight.w600),),),
          ),
        // body: _pages[_page],
        bottomNavigationBar: CurvedNavigationBar(
            onTap: (index){
              setState(() {
              _page=index;
              print(index);
            });

            },
            backgroundColor: Color.fromARGB(239, 0, 0, 0),
            buttonBackgroundColor: Color.fromARGB(255, 155, 8, 8),
            animationDuration: Duration(milliseconds: 300),
            color: Color.fromARGB(255, 155, 8, 8),
            items: [
            CurvedNavigationBarItem(child: Icon(Icons.directions_walk_sharp),),
            CurvedNavigationBarItem(child: Icon(Icons.watch_later_outlined),),
            CurvedNavigationBarItem(child: Icon(Icons.health_and_safety_outlined),),
          ]),
      ),
    );
  }
  
}

import 'package:flutter/material.dart';
import 'package:shopping_app2/cart_page.dart';
import 'package:shopping_app2/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [ // making the list of widgets
      const ProductList(), 
       const cart_page(),
    ];

    return Scaffold(
      body: IndexedStack( // indexedStack used coz when we return from cart same page is maintained and it does not start from the starting 
        index:_selectedIndex ,
        children: pages,
      ),
      
      //body:pages[_selectedIndex], ----// if index is 0 then productList() else when its 1 car_page()
     
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: ""
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped, // -> onTap ek callback h which gets triggered when u tap on it  
                              // -> it provides index of the tapped item as an argument
      ),
    );
  }
}

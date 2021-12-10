import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Daniel Larson'),
      ),

      body: PageView(
        controller: pageController,
        children: [
          Container(color:Colors.black54),
          Image.asset('assets/dude.jpg'),
          Image.asset('assets/garfield.jpg'),
          Image.asset('assets/dude.jpg'),
          Image.asset('assets/kd.jpg'),
          Image.asset('assets/dude.jpg')
        ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.sports_bar), label: 'Fuck Head'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Back'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Settings')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onTapped
      ),
    );
  }
}
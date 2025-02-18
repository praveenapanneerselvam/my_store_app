import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'product_list_page.dart';
import 'cart_page.dart';
import 'checkout_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    WelcomePage(),
    ProductListPage(),
    CartPage(),
    CheckoutPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blueAccent),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store, color: Colors.green),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.orange),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment, color: Colors.red),
            label: "Checkout",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 10, // Adds shadow
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

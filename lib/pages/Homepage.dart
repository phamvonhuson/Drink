import 'package:flutter/material.dart';
import 'package:flutter_project/components/bottom_nav_bar.dart';
import 'package:flutter_project/const.dart';
import 'package:flutter_project/pages/CartPage.dart';
import 'package:flutter_project/pages/ShopPage.dart';
import 'package:flutter_project/pages/login_page.dart'; 

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  // Hàm điều hướng khi thay đổi tab
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Danh sách các trang cho các tab
  final List<Widget> _pages = [
    // Shop page
    Shoppage(),
    // Cart page
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor, // Background color of the AppBar
        title: const Text("Homepage"), // Title of the AppBar
        actions: [
          // Nút Logout
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Khi nhấn Logout, chuyển hướng về trang Login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(
                    onTap: () {
                      // Action when login button is tapped
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: navigateBottomBar, // Truyền đúng hàm vào đây
      ),
      body: _pages[_selectedIndex], // Chọn trang tương ứng theo index
    );
  }
}

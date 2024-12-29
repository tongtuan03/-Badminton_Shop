import 'package:batminton_shop/src/features/core/screens/pages/cart_page.dart';
import 'package:batminton_shop/src/features/core/screens/pages/history_page.dart';
import 'package:batminton_shop/src/features/core/screens/pages/notification_page.dart';
import 'package:batminton_shop/src/features/core/screens/pages/person_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/login_state.dart';
import '../../../authentication/controllers/login_controller.dart';
import '../../../authentication/screens/welcome_screen/welcome_screen.dart';
import '../pages/home_page.dart';

class Dashboard extends StatelessWidget {
  final controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Badminton Shop"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Phần đầu của Drawer, có thể chứa hình ảnh, tên người dùng, hoặc thông tin khác
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'user@example.com',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            // Các mục điều hướng hoặc hành động trong Drawer
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              subtitle: const Text("Đi đến Home"),
              onTap: () {
                // Đóng Drawer khi nhấn và điều hướng
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Đóng Drawer khi nhấn và điều hướng
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact'),
              onTap: () {
                // Đóng Drawer khi nhấn và điều hướng
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Đóng Drawer khi nhấn và điều hướng
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => NavigationBar(
              height: 100,
              backgroundColor: Colors.white,
              indicatorColor: Colors.transparent,
              // surfaceTintColor: Colors.green,
              shadowColor: Colors.amber,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  {controller.selectedIndex.value = index},
              destinations: const <Widget>[
                NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    label: "Home",
                    selectedIcon: Icon(Icons.home_filled, color: Colors.red)),
                NavigationDestination(
                    icon: Icon(Icons.add_shopping_cart_outlined),
                    label: "Cart",
                    selectedIcon: Icon(Icons.add_shopping_cart_rounded,
                        color: Colors.red)),
                NavigationDestination(
                  icon: Icon(Icons.history_toggle_off_outlined),
                  label: "History",
                  selectedIcon: Icon(
                    Icons.history_toggle_off_rounded,
                    color: Colors.red,
                  ),
                ),
                NavigationDestination(
                    icon: Icon(Icons.notifications_active_outlined),
                    label: "Notification",
                    selectedIcon:
                        Icon(Icons.notifications_active, color: Colors.red)),
                NavigationDestination(
                    icon: Icon(Icons.person_outline),
                    label: "Person",
                    selectedIcon: Icon(Icons.person, color: Colors.red)),
              ])),
    );
  }
}

class NavigationController extends GetxController {
  Rx<int> selectedIndex = 0.obs;
  final screen = [
    HomePage(),
    CartPage(),
    HistoryPage(),
    NotificationPage(),
    PersonPage()
  ];
}

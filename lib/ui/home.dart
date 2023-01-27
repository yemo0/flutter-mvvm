import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm/constants/keys.dart';
import 'package:mvvm/provider/data_provider.dart';
import 'package:mvvm/provider/navigation_provider.dart';

import 'screens/home.dart';
import 'screens/profile.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageModel navigation = ref.watch(navigationProvider);

    return Scaffold(
      body: currentScreen(navigation.index),
      bottomNavigationBar: BottomNavigationBar(
          key: Keys.NAV_BAR,
          currentIndex: navigation.index,
          onTap: (index) {
            ref.read(navigationProvider.notifier).selectPage(index);
          },
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home,
                  key: Keys.NAV_HOME,
                )),
            BottomNavigationBarItem(
                label: "My",
                icon: Icon(
                  Icons.settings,
                  key: Keys.NAV_MY,
                ))
          ]),
      floatingActionButton: Container(
        width: 40.0,
        height: 40.0,
        color: Colors.green,
        child: RawMaterialButton(
          shape: const CircleBorder(),
          elevation: 0.0,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            ref.read(dataProvider.notifier).state++;
          },
        ),
      ),
    );
  }

  Widget currentScreen(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }
}

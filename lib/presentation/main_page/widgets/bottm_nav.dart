import 'package:flutter/material.dart';

ValueNotifier<int> IndexNavNotifier = ValueNotifier(0);

class BottomNavigationWidgets extends StatelessWidget {
  const BottomNavigationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: IndexNavNotifier,
        builder: (BuildContext context, int newindex, Widget? _) {
          return BottomNavigationBar(
              currentIndex: newindex,
              onTap: (value) {
                IndexNavNotifier.value = value;
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              selectedItemColor: const Color.fromARGB(255, 251, 251, 251),
              unselectedItemColor: Color.fromARGB(201, 158, 158, 158),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.perm_media), label: 'New & Hot'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_emotions), label: 'Fast Laughs'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.download), label: 'Downloads'),
              ]);
        });
  }
}

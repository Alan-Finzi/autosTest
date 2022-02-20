import 'package:auto_test_app/pages/history_services_page.dart';
import 'package:auto_test_app/pages/load_page.dart';
import 'package:auto_test_app/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'home_page.dart';


class StartPage extends StatefulWidget {
    static const String routeName = 'start_page';

  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
    var _currentIndex = 0;
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: _widgetOptions.elementAt(_currentIndex),
            bottomNavigationBar: SalomonBottomBar(
                currentIndex: _currentIndex,
                selectedItemColor: Colors.blue,
                onTap: (i) {setState(() {_currentIndex = i;});},
                items: [
                    SalomonBottomBarItem(
                        icon: const Icon(Icons.home),
                        title: const Text("Home"),
                        selectedColor: Colors.purple,
                    ),
                    SalomonBottomBarItem(
                        icon: const Icon(Icons.search),
                        title: const Text("Buscar"),
                        selectedColor: Colors.pink,
                    ),
                    SalomonBottomBarItem(
                        icon: const Icon(Icons.fiber_new ),
                        title: const Text("Nuevo Cliente"),
                        selectedColor: Colors.orange,
                    ),
                    SalomonBottomBarItem(
                        icon: const Icon(Icons.history),
                        title: const Text("Historial de servicios"),
                        selectedColor: Colors.teal,
                    ),
                ],
            ),
        );
    }

    final List<Widget> _widgetOptions = <Widget>[
        const HomePage(),
        const SearchPage(),
        const LoadPage(),
        const HistoryServicesPage(),
    ];




}


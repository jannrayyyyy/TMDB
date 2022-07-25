import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

import '../../core/theme/themedata.dart';
import 'homepage.dart';
import 'searchpage.dart';
import 'settingpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 1;
  final List _screen = [
    const SearchPage(),
    const HomePage(),
    const SettingPage(),
  ];
  final _items = const [
    Iconify(Ic.baseline_search),
    Iconify(Ic.baseline_home),
    Iconify(Ic.round_settings),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: bg,
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            index: _index,
            items: _items,
            backgroundColor: Colors.transparent,
            onTap: (index) => setState(() {
                  _index = index;
                })),
        body: _screen[_index],
      ),
    );
  }
}

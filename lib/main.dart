import 'package:flutter/material.dart';
import 'package:flutter_application/Bmi/BmiMain.dart';
import 'package:flutter_application/StopWatch/StopWatchMain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var _index = 0; // 페이지 인덱스 0, 1, 2
  var _pages = [
    BmiPage(),
    StopWatchPage(),
    BmiPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          '플러터 Application',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index; // 선택된 탭의 인덱스로 _index를 변경
          });
        },
        currentIndex: _index, // 선택된 인덱스
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'BMI 계산기',
            icon: Icon(Icons.calculate),
          ),
          BottomNavigationBarItem(
            label: '스톱워치',
            icon: Icon(Icons.access_time_rounded),
          ),
          BottomNavigationBarItem(
            label: 'TO-DO',
            icon: Icon(Icons.list_rounded),
          ),
        ],
      ),
    );
  }
}

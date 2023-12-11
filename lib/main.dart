import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '폼 검증 데모',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // TextField의 현잿값을 얻는 데 필요
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // addListener로 상태를 모니터링할 수 있음
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // 화면이 종료될 때는 반드시 위젯 트리에서 컨트롤러를 해제해야 함
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    // 컨트롤러의 text 프로퍼티로 연결된 TextField에 입력된 값을 얻음
    print("두 번째 text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Input 연습'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) { // 텍스트 변경 감지 이벤트
                print("첫 번째 text field: $text");
              },
            ),
            TextField(
              controller: myController, // 컨트롤러를 지정
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math'; // для рандома

void main() {
  runApp(MyApp());
}
// запускается

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    // билдится виджет
    return MaterialApp(
      title: 'Roll',
      theme: ThemeData.dark(), // Устанавливаем тёмную тему
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
} // изменяемый виджет



class _MyHomePageState extends State<MyHomePage> {
  // Все мои дайсы
  final List<String> s = [
    'assets/dice_1.png',
    'assets/dice_2.png',
    'assets/dice_3.png',
    'assets/dice_4.png',
    'assets/dice_5.png',
    'assets/dice_6.png',
  ];

  // Запомним текущую ссылку
  String imagik = 'assets/dice_1.png';
  bool _isImageVisible = false;

  // void change
  void change1() {
    setState(() {
      // Генерация случайного индекса для списка изображений
      final random = Random();
      imagik = s[random.nextInt(s.length)];
      _isImageVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MKN 2024'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // центрируем
          children: <Widget>[
            if (_isImageVisible)
              Image.asset(
                imagik, // Изображение
                width: 200.0,
                height: 200.0,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: change1, // Смена изображения по нажатию кнопки
              child: Text('Rolling'),
            ),
          ],
        ),
      ),
    );
  }
}
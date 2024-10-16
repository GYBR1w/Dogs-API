import 'package:flutter/material.dart';
import 'dog_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Случайные изображения собак',
      home: DogHomePage(),
    );
  }
}

class DogHomePage extends StatefulWidget {
  @override
  _DogHomePageState createState() => _DogHomePageState();
}

class _DogHomePageState extends State<DogHomePage> {
  String _dogImageUrl = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDogImage();
  }

  Future<void> _fetchDogImage() async {
    setState(() {
      _isLoading = true;
    });

    final imageUrl = await fetchRandomDogImage();
    setState(() {
      _dogImageUrl = imageUrl;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Случайные изображения собак')),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              _dogImageUrl,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchDogImage,
              child: Text('Получить новое изображение'),
            ),
          ],
        ),
      ),
    );
  }
}
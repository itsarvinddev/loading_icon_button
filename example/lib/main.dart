import 'package:flutter/material.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading Icon Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _handlePress() async {
    // Simulate network request
    await Future.delayed(const Duration(seconds: 2));

    // Simulate random success/failure
    if (DateTime.now().millisecondsSinceEpoch % 2 == 0) {
      throw Exception('Random error occurred');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading Icon Button Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Simple usage
            LoadingButton(
              onPressed: _handlePress,
              child: const Text('Simple Button'),
            ),

            const SizedBox(height: 20),

            // Builder pattern usage
            LoadingButtonBuilder.elevated()
                .onPressed(_handlePress)
                .child(const Text('Builder Pattern'))
                .loadingText('Processing...')
                .successText('Done!')
                .errorText('Failed!')
                .width(200)
                .height(50)
                .style(const LoadingButtonStyle(
                  backgroundColor: Colors.purple,
                  borderRadius: 25,
                ))
                .build(),

            const SizedBox(height: 20),

            // Outlined button
            LoadingButtonBuilder.outlined()
                .onPressed(_handlePress)
                .child(const Text('Outlined Button'))
                .style(const LoadingButtonStyle(
                  borderColor: Colors.green,
                  borderWidth: 2,
                ))
                .build(),

            const SizedBox(height: 20),

            // With custom widgets
            LoadingButton(
              type: ButtonType.filled,
              onPressed: _handlePress,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.upload),
                  SizedBox(width: 8),
                  Text('Upload'),
                ],
              ),
              loadingWidget: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text('Uploading...'),
                ],
              ),
              successWidget: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle),
                  SizedBox(width: 8),
                  Text('Uploaded!'),
                ],
              ),
              errorWidget: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error),
                  SizedBox(width: 8),
                  Text('Failed!'),
                ],
              ),
              onError: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: $error')),
                );
              },
              onStateChanged: (state) {
                print('Button state changed to: $state');
              },
            ),
          ],
        ),
      ),
    );
  }
}

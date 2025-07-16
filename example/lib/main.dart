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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoadingButtonDemo(),
    );
  }
}

class LoadingButtonDemo extends StatefulWidget {
  const LoadingButtonDemo({Key? key}) : super(key: key);

  @override
  _LoadingButtonDemoState createState() => _LoadingButtonDemoState();
}

class _LoadingButtonDemoState extends State<LoadingButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading Icon Button Demo'),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header
                Text(
                  'LoadingButton Examples',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 20),

                // 1. AutoLoadingButton (Material Design)
                _buildSectionHeader('1. AutoLoadingButton (Material)'),
                ElevatedAutoLoadingButton(
                  onPressed: () => _simulateAutoOperation(),
                  child: const Text('Auto Loading Button'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.purple),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    elevation: WidgetStateProperty.all(4),
                  ),
                  loadingIcon: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('Processing...'),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // 2. Material LoadingButton with Builder Pattern
                _buildSectionHeader('2. Material LoadingButton (Builder)'),
                LoadingButtonBuilder.filled()
                    .onPressed(() => _simulateUpload())
                    .child(const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.cloud_upload),
                        SizedBox(width: 8),
                        Text('Upload File'),
                      ],
                    ))
                    .style(LoadingButtonStyle(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      loadingBackgroundColor: Colors.indigo.shade300,
                      successBackgroundColor: Colors.green,
                      errorBackgroundColor: Colors.red,
                      borderRadius: 8,
                      elevation: 2,
                    ))
                    .loadingText('Uploading...')
                    .successText('Uploaded!')
                    .errorText('Failed!')
                    .build(),
                const SizedBox(height: 30),

                // 3. Elevated LoadingButton
                _buildSectionHeader('3. Elevated LoadingButton'),
                LoadingButton(
                  type: ButtonType.elevated,
                  onPressed: () => _simulateLogin(),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.login),
                      SizedBox(width: 8),
                      Text('Login'),
                    ],
                  ),
                  style: const LoadingButtonStyle(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    borderRadius: 8,
                  ),
                  loadingText: 'Logging in...',
                  successText: 'Welcome!',
                  errorText: 'Login failed',
                  onError: (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login error: $error'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),

                // 4. Outlined LoadingButton
                _buildSectionHeader('4. Outlined LoadingButton'),
                LoadingButtonBuilder.outlined()
                    .onPressed(() => _simulateDownload())
                    .child(const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.download),
                        SizedBox(width: 8),
                        Text('Download'),
                      ],
                    ))
                    .style(const LoadingButtonStyle(
                      borderColor: Colors.blue,
                      borderWidth: 2,
                      foregroundColor: Colors.blue,
                      borderRadius: 25,
                    ))
                    .loadingText('Downloading...')
                    .successText('Downloaded!')
                    .errorText('Failed!')
                    .build(),
                const SizedBox(height: 30),

                // 5. Text Button Style
                _buildSectionHeader('5. Text Button Style'),
                LoadingButtonBuilder.text()
                    .onPressed(() => _simulateTextAction())
                    .child(const Text('Text Button'))
                    .style(const LoadingButtonStyle(
                      foregroundColor: Colors.deepOrange,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ))
                    .loadingText('Loading...')
                    .successText('Done!')
                    .errorText('Error!')
                    .build(),
                const SizedBox(height: 30),

                // 6. Icon Button Style
                _buildSectionHeader('6. Icon Button Style'),
                LoadingButton(
                  type: ButtonType.icon,
                  onPressed: () => _simulateIconAction(),
                  child: const Icon(Icons.favorite),
                  style: const LoadingButtonStyle(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    iconSize: 24,
                  ),
                  loadingWidget: const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  successWidget: const Icon(Icons.check, color: Colors.white),
                  errorWidget: const Icon(Icons.error, color: Colors.white),
                  onError: (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Icon action failed'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),

                // 7. Custom Styled Button
                _buildSectionHeader('7. Custom Styled Button'),
                LoadingButton(
                  type: ButtonType.filled,
                  onPressed: () => _simulateCustomAction(),
                  child: const Text('Custom Button'),
                  style: LoadingButtonStyle(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    loadingBackgroundColor: Colors.deepPurple.shade300,
                    successBackgroundColor: Colors.green,
                    errorBackgroundColor: Colors.red,
                    borderRadius: 30,
                    elevation: 8,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                  ),
                  loadingText: 'Processing...',
                  successText: 'Success!',
                  errorText: 'Try Again',
                  width: double.infinity,
                  height: 60,
                  onStateChanged: (state) {
                    print('Button state changed to: $state');
                  },
                ),
                const SizedBox(height: 30),

                // 8. Submit Form Button
                _buildSectionHeader('8. Submit Form Button'),
                LoadingButton(
                  type: ButtonType.elevated,
                  onPressed: () => _simulateFormSubmit(),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.send),
                      SizedBox(width: 8),
                      Text('Submit Form'),
                    ],
                  ),
                  style: const LoadingButtonStyle(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    borderRadius: 12,
                    elevation: 4,
                  ),
                  loadingWidget: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('Submitting...'),
                    ],
                  ),
                  successWidget: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle, size: 18),
                      SizedBox(width: 8),
                      Text('Submitted!'),
                    ],
                  ),
                  errorWidget: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.error, size: 18),
                      SizedBox(width: 8),
                      Text('Failed!'),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  // Simulation methods
  Future<void> _simulateLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    // Simulate random success/failure
    if (DateTime.now().millisecondsSinceEpoch % 3 == 0) {
      throw Exception('Invalid credentials');
    }
    // Success is automatic if no exception is thrown
  }

  Future<void> _simulateAutoOperation() async {
    await Future.delayed(const Duration(seconds: 2));

    // Simulate random success/failure
    if (DateTime.now().millisecondsSinceEpoch % 3 == 0) {
      throw Exception('Auto operation failed');
    }
    // Success is automatic
  }

  Future<void> _simulateUpload() async {
    await Future.delayed(const Duration(seconds: 3));

    // Simulate random success/failure
    if (DateTime.now().millisecondsSinceEpoch % 5 == 0) {
      throw Exception('Upload failed');
    }
    // Success is automatic
  }

  Future<void> _simulateDownload() async {
    await Future.delayed(const Duration(milliseconds: 2000));

    // Simulate random success/failure
    if (DateTime.now().millisecondsSinceEpoch % 4 == 0) {
      throw Exception('Download failed');
    }
    // Success is automatic
  }

  Future<void> _simulateTextAction() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    // Simulate random success/failure
    if (DateTime.now().millisecondsSinceEpoch % 3 == 0) {
      throw Exception('Text action failed');
    }
  }

  Future<void> _simulateIconAction() async {
    await Future.delayed(const Duration(milliseconds: 800));

    // Simulate random success/failure
    if (DateTime.now().millisecondsSinceEpoch % 4 == 0) {
      throw Exception('Icon action failed');
    }
  }

  Future<void> _simulateCustomAction() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    // Simulate random success/failure
    if (DateTime.now().millisecondsSinceEpoch % 3 == 0) {
      throw Exception('Custom action failed');
    }
  }

  Future<void> _simulateFormSubmit() async {
    await Future.delayed(const Duration(seconds: 2));

    // Simulate random success/failure
    if (DateTime.now().millisecondsSinceEpoch % 4 == 0) {
      throw Exception('Form submission failed');
    }
  }
}

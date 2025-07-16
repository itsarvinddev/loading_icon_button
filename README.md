# loading_icon_button

[![pub package](https://img.shields.io/pub/v/loading_icon_button.svg)](https://pub.dev/packages/loading_icon_button)
[![GitHub Stars](https://img.shields.io/github/stars/itsarvinddev/loading_icon_button.svg?style=social&label=Star)](https://github.com/itsarvinddev/loading_icon_button)
[![GitHub Issues](https://img.shields.io/github/issues/itsarvinddev/loading_icon_button.svg)](https://github.com/itsarvinddev/loading_icon_button/issues)
[![GitHub License](https://img.shields.io/github/license/itsarvinddev/loading_icon_button.svg)](https://github.com/itsarvinddev/loading_icon_button/blob/master/LICENSE)
[![X](https://img.shields.io/badge/X-Follow-blue)](https://x.com/itsarvinddev)

A comprehensive Flutter package providing customizable loading buttons with icons, text, and smooth animations. Features multiple button types including `LoadingButton`, `AutoLoadingButton`, and `ArgonButton` with Material Design compliance.

<img src="https://github.com/itsarvinddev/loading_icon_button/blob/master/generated-image.png" width="300" height="600" />

## Features

- ✅ **Multiple Button Types**: `LoadingButton`, `AutoLoadingButton`, and `ArgonButton`
- ✅ **Material Design**: Full Material Design compliance with Material 3 support
- ✅ **Customizable States**: Idle, Loading, Success, Error states with smooth transitions
- ✅ **Icon Support**: Built-in icon support with customizable icons for each state
- ✅ **Cross-Platform**: Works on Android, iOS, Linux, macOS, web, and Windows
- ✅ **Accessible**: Full accessibility support with semantic labels
- ✅ **Responsive**: Automatic responsive design for tablets and mobile devices
- ✅ **Zero Boilerplate**: Easy to use with minimal configuration
- ✅ **Customizable Animations**: Configurable animation durations and effects

## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  loading_icon_button: ^latest
```

Then run:

```bash
flutter pub get
```

## Quick Start

### Import

```dart
import 'package:loading_icon_button/loading_icon_button.dart';
```

### Basic Usage

```dart
final LoadingButtonController _btnController = LoadingButtonController();

LoadingButton(
  child: const Text('Login with Apple'),
  iconData: Icons.apple,
  onPressed: () => _handleLogin(),
  controller: _btnController,
)
```

## Button Types

### 1. LoadingButton

The main button with full customization options:

```dart
LoadingButton(
  child: const Text('Submit'),
  iconData: Icons.send,
  onPressed: () async {
    // Your async operation
    await Future.delayed(Duration(seconds: 2));
    _btnController.success();
  },
  controller: _btnController,
  duration: Duration(milliseconds: 300),
  successColor: Colors.green,
  errorColor: Colors.red,
  successIcon: Icons.check,
  failedIcon: Icons.error,
)
```

### 2. AutoLoadingButton (Material Design)

From the `material/` folder - A Material Design compliant button with automatic loading states:

```dart
AutoLoadingButton(
  onPressed: () async {
    // Automatically shows loading state
    await _performOperation();
    // Automatically shows success/error state
  },
  child: Text('Auto Loading'),
  type: ButtonType.elevated,
  style: LoadingButtonStyle(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    borderRadius: 8.0,
  ),
)
```

### 3. LoadingButton (Material Design)

From the `material/` folder - Enhanced Material Design button with advanced features:

```dart
LoadingButton(
  type: ButtonType.filled,
  onPressed: _handleSubmit,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.upload),
      SizedBox(width: 8),
      Text('Upload File'),
    ],
  ),
  loadingWidget: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
      SizedBox(width: 8),
      Text('Uploading...'),
    ],
  ),
  successWidget: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.check_circle),
      SizedBox(width: 8),
      Text('Uploaded!'),
    ],
  ),
  onError: (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $error')),
    );
  },
)
```

### 4. ArgonButton

A specialized button with advanced loader customization:

```dart
ArgonButton(
  height: 50,
  width: 350,
  borderRadius: 5.0,
  color: Color(0xFF7866FE),
  child: Text(
    "Continue",
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
  ),
  loader: Container(
    padding: EdgeInsets.all(10),
    child: CircularProgressIndicator(
      color: Colors.white,
    ),
  ),
  onTap: (startLoading, stopLoading, btnState) {
    if (btnState == ButtonState.Idle) {
      startLoading();
      // Perform your operation
      doNetworkRequest().then((_) {
        stopLoading();
      });
    }
  },
)
```

## Builder Pattern (Recommended)

Use the fluent builder pattern for cleaner code:

```dart
LoadingButtonBuilder.elevated()
  .onPressed(_handleSubmit)
  .child(Text('Submit'))
  .loadingText('Processing...')
  .successText('Done!')
  .errorText('Failed!')
  .style(LoadingButtonStyle(
    backgroundColor: Colors.blue,
    borderRadius: 25,
  ))
  .build()
```

## Properties

### LoadingButton Properties

| Property             | Type                      | Default        | Description                               |
| -------------------- | ------------------------- | -------------- | ----------------------------------------- |
| `child`              | `Widget`                  | required       | The widget to display when button is idle |
| `iconData`           | `IconData?`               | `null`         | Icon to display alongside text            |
| `onPressed`          | `VoidCallback?`           | `null`         | Callback when button is pressed           |
| `controller`         | `LoadingButtonController` | required       | Controller to manage button state         |
| `duration`           | `Duration`                | `300ms`        | Animation duration                        |
| `loaderSize`         | `double`                  | `20.0`         | Size of the loading indicator             |
| `animateOnTap`       | `bool`                    | `true`         | Whether to animate on tap                 |
| `resetAfterDuration` | `bool`                    | `true`         | Auto-reset after success/error            |
| `errorColor`         | `Color?`                  | `Colors.red`   | Color for error state                     |
| `successColor`       | `Color?`                  | `Colors.green` | Color for success state                   |
| `successIcon`        | `IconData?`               | `Icons.check`  | Icon for success state                    |
| `failedIcon`         | `IconData?`               | `Icons.error`  | Icon for error state                      |
| `iconColor`          | `Color?`                  | `null`         | Color for icons                           |
| `showBox`            | `bool`                    | `true`         | Whether to show button container          |

### AutoLoadingButton Properties

| Property        | Type                  | Default    | Description                              |
| --------------- | --------------------- | ---------- | ---------------------------------------- |
| `onPressed`     | `VoidCallback?`       | `null`     | Async callback function                  |
| `child`         | `Widget`              | required   | Button content                           |
| `type`          | `ButtonType`          | `elevated` | Button type (elevated, filled, outlined) |
| `style`         | `LoadingButtonStyle?` | `null`     | Button styling                           |
| `loadingWidget` | `Widget?`             | `null`     | Custom loading widget                    |
| `successWidget` | `Widget?`             | `null`     | Custom success widget                    |
| `errorWidget`   | `Widget?`             | `null`     | Custom error widget                      |
| `onError`       | `Function(dynamic)?`  | `null`     | Error handling callback                  |

### ArgonButton Properties

| Property       | Type                                        | Default       | Description                     |
| -------------- | ------------------------------------------- | ------------- | ------------------------------- |
| `height`       | `double`                                    | `50.0`        | Button height                   |
| `width`        | `double`                                    | `350.0`       | Button width                    |
| `borderRadius` | `double`                                    | `5.0`         | Border radius                   |
| `color`        | `Color`                                     | `Colors.blue` | Button background color         |
| `child`        | `Widget`                                    | required      | Button content                  |
| `loader`       | `Widget?`                                   | `null`        | Custom loader widget            |
| `onTap`        | `Function(Function, Function, ButtonState)` | required      | Tap callback with state control |

## Examples

### Basic Login Button

```dart
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State {
  final LoadingButtonController _btnController = LoadingButtonController();

  void _handleLogin() async {
    try {
      // Simulate login process
      await Future.delayed(Duration(seconds: 2));

      // Simulate random success/failure
      if (DateTime.now().millisecondsSinceEpoch % 2 == 0) {
        _btnController.success();
      } else {
        _btnController.error();
      }
    } catch (e) {
      _btnController.error();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingButton(
          controller: _btnController,
          onPressed: _handleLogin,
          child: Text('Login'),
          iconData: Icons.login,
          successIcon: Icons.check_circle,
          failedIcon: Icons.error_outline,
        ),
      ),
    );
  }
}
```

### File Upload with Progress

```dart
class FileUploadButton extends StatelessWidget {
  Future _uploadFile() async {
    // Simulate file upload
    await Future.delayed(Duration(seconds: 3));

    // Simulate random success/failure
    if (Random().nextBool()) {
      throw Exception('Upload failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      type: ButtonType.elevated,
      onPressed: _uploadFile,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.cloud_upload),
          SizedBox(width: 8),
          Text('Upload File'),
        ],
      ),
      loadingWidget: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: 8),
          Text('Uploading...'),
        ],
      ),
      successWidget: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle),
          SizedBox(width: 8),
          Text('Uploaded!'),
        ],
      ),
      onError: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload failed: $error')),
        );
      },
    );
  }
}
```

### Custom Styled Button

```dart
LoadingButtonBuilder.filled()
  .onPressed(_handleSubmit)
  .child(Text('Custom Button'))
  .style(LoadingButtonStyle(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.white,
    loadingBackgroundColor: Colors.deepPurple.shade300,
    successBackgroundColor: Colors.green,
    errorBackgroundColor: Colors.red,
    borderRadius: 30,
    elevation: 8,
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  ))
  .loadingText('Processing...')
  .successText('Success!')
  .errorText('Try Again')
  .build()
```

## Global Configuration

Set global defaults for all buttons:

```dart
void main() {
  // Configure global settings
  LoadingButtonConfig().defaultAnimationDuration = Duration(milliseconds: 400);
  LoadingButtonConfig().enableHapticFeedback = true;
  LoadingButtonConfig().defaultLoadingWidget = MyCustomSpinner();

  runApp(MyApp());
}
```

## Accessibility

The package includes full accessibility support:

- **Semantic Labels**: Automatic screen reader support
- **Focus Management**: Proper keyboard navigation
- **State Announcements**: Screen reader announces state changes
- **High Contrast**: Supports high contrast mode

```dart
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  // Accessibility labels
  loadingText: 'Processing your request',
  successText: 'Request completed successfully',
  errorText: 'Request failed, please try again',
)
```

## Migration Guide

### From v0.0.6 to v0.0.7

- Update import statements
- Replace deprecated properties with new equivalents
- Use `LoadingButtonStyle` for styling instead of individual properties

See the [Migration Guide](https://pub.dev/packages/loading_icon_button/changelog) for detailed instructions.

## Platform Support

| Platform | Support |
| -------- | ------- |
| Android  | ✅      |
| iOS      | ✅      |
| Linux    | ✅      |
| macOS    | ✅      |
| Web      | ✅      |
| Windows  | ✅      |

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Setup

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter test` to ensure tests pass
4. Make your changes
5. Add tests for new features
6. Submit a pull request

## Issues and Feedback

Please file issues and feedback on the [GitHub Issues](https://github.com/itsarvinddev/loading_icon_button/issues) page.

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/itsarvinddev/loading_icon_button/blob/master/LICENSE) file for details.

## Acknowledgments

Special thanks to the Flutter community and contributors who made this package possible.

- [Contributors](https://github.com/itsarvinddev/loading_icon_button/graphs/contributors)
- Inspired by [rounded_loading_button](https://pub.dev/packages/rounded_loading_button)
- Material Design guidelines

**Package:** [loading_icon_button](https://pub.dev/packages/loading_icon_button)  
**Repository:** [GitHub](https://github.com/itsarvinddev/loading_icon_button)  
**Issues:** [Report Issues](https://github.com/itsarvinddev/loading_icon_button/issues)

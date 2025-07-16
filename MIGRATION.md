# Migration Guide for LoadingButton v1.0.0

This guide will help you migrate from the previous version of LoadingButton to the new v1.0.0 with improved API, better error handling, and enhanced features.

## Breaking Changes Overview

### 1. Import Changes

**Before (v0.x):**

```dart
import 'package:loading_button/loading_button.dart';
```

**After (v1.0.0):**

```dart
import 'package:loading_button/loading_button.dart';
// All classes are now exported from the main library file
```

### 2. Constructor Changes

**Before (v0.x):**

```dart
LoadingButton(
  onPressed: () async {
    // your code
  },
  child: Text('Submit'),
  // Direct style properties
  color: Colors.blue,
  textColor: Colors.white,
  borderRadius: 8.0,
  elevation: 1.0,
)
```

**After (v1.0.0):**

```dart
LoadingButton(
  onPressed: () async {
    // your code
  },
  child: Text('Submit'),
  // Consolidated style object
  style: LoadingButtonStyle(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    borderRadius: 8.0,
    elevation: 1.0,
  ),
)
```

### 3. Button Type Specification

**Before (v0.x):**

```dart
// Separate constructors
LoadingButton.elevated(...)
LoadingButton.outlined(...)
LoadingButton.text(...)
```

**After (v1.0.0):**

```dart
// Single constructor with type parameter
LoadingButton(
  type: ButtonType.elevated,
  // ... other properties
)

// OR use builder pattern
LoadingButtonBuilder.elevated()
  .child(Text('Submit'))
  .build()
```

## Step-by-Step Migration

### Step 1: Update Dependencies

Update your `pubspec.yaml`:

```yaml
dependencies:
  loading_button: ^1.0.0
```

### Step 2: Update Imports

No changes needed if you were importing from the main library file.

### Step 3: Migrate Button Creation

#### Basic Button Migration

**Before:**

```dart
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  color: Colors.blue,
  textColor: Colors.white,
  loadingColor: Colors.lightBlue,
  successColor: Colors.green,
  errorColor: Colors.red,
  borderRadius: 8.0,
  elevation: 1.0,
  width: 200,
  height: 50,
)
```

**After:**

```dart
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  style: LoadingButtonStyle(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    loadingBackgroundColor: Colors.lightBlue,
    successBackgroundColor: Colors.green,
    errorBackgroundColor: Colors.red,
    borderRadius: 8.0,
    elevation: 1.0,
  ),
  width: 200,
  height: 50,
)
```

#### Elevated Button Migration

**Before:**

```dart
LoadingButton.elevated(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  color: Colors.blue,
  textColor: Colors.white,
)
```

**After:**

```dart
LoadingButton(
  type: ButtonType.elevated,
  onPressed: _handleSubmit,
  child: Text('Submit'),
  style: LoadingButtonStyle(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
)
```

#### Outlined Button Migration

**Before:**

```dart
LoadingButton.outlined(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  borderColor: Colors.blue,
  borderWidth: 1.0,
  textColor: Colors.blue,
)
```

**After:**

```dart
LoadingButton(
  type: ButtonType.outlined,
  onPressed: _handleSubmit,
  child: Text('Submit'),
  style: LoadingButtonStyle(
    borderColor: Colors.blue,
    borderWidth: 1.0,
    foregroundColor: Colors.blue,
  ),
)
```

### Step 4: Migrate Custom Widgets

#### Loading Widget Migration

**Before:**

```dart
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  loadingChild: CircularProgressIndicator(),
)
```

**After:**

```dart
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  loadingWidget: CircularProgressIndicator(),
)
```

#### Success and Error Widgets

**Before:**

```dart
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  successChild: Icon(Icons.check),
  errorChild: Icon(Icons.error),
)
```

**After:**

```dart
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  successWidget: Icon(Icons.check),
  errorWidget: Icon(Icons.error),
)
```

### Step 5: Migrate State Callbacks

**Before:**

```dart
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  onStateChanged: (state) {
    print('State: $state');
  },
)
```

**After:**

```dart
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  onStateChanged: (ButtonState state) {
    print('State: $state');
    // state is now a proper enum
  },
)
```

### Step 6: Migrate Error Handling

**Before:**

```dart
LoadingButton(
  onPressed: () async {
    try {
      await _handleSubmit();
    } catch (e) {
      // Handle error manually
    }
  },
  child: Text('Submit'),
)
```

**After:**

```dart
LoadingButton(
  onPressed: _handleSubmit, // Can throw directly
  child: Text('Submit'),
  onError: (error) {
    // Automatic error handling
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $error')),
    );
  },
)
```

### Step 7: Migrate Duration Settings

**Before:**

```dart
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  animationDuration: Duration(milliseconds: 300),
  resetDuration: Duration(seconds: 2),
)
```

**After:**

```dart
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  animationDuration: Duration(milliseconds: 300),
  successDuration: Duration(seconds: 2),
  errorDuration: Duration(seconds: 2),
)
```

## New Features in v1.0.0

### 1. Builder Pattern (Recommended)

```dart
// New fluent API
LoadingButtonBuilder.elevated()
  .onPressed(_handleSubmit)
  .child(Text('Submit'))
  .loadingText('Processing...')
  .successText('Done!')
  .errorText('Failed!')
  .width(200)
  .height(50)
  .style(LoadingButtonStyle(
    backgroundColor: Colors.blue,
    borderRadius: 25,
  ))
  .onError((error) => _handleError(error))
  .build()
```

### 2. Global Configuration

```dart
// Set global defaults
LoadingButtonConfig().defaultAnimationDuration = Duration(milliseconds: 500);
LoadingButtonConfig().enableHapticFeedback = true;
LoadingButtonConfig().defaultLoadingWidget = MyCustomSpinner();
```

### 3. Enhanced State Management

```dart
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  onStateChanged: (ButtonState state) {
    switch (state) {
      case ButtonState.idle:
        // Handle idle state
        break;
      case ButtonState.loading:
        // Handle loading state
        break;
      case ButtonState.success:
        // Handle success state
        break;
      case ButtonState.error:
        // Handle error state
        break;
      case ButtonState.disabled:
        // Handle disabled state
        break;
    }
  },
)
```

### 4. Accessibility Improvements

```dart
// Automatic accessibility support
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  loadingText: 'Processing your request', // Used for screen readers
  successText: 'Request completed successfully',
  errorText: 'Request failed, please try again',
)
```

### 5. Responsive Design

```dart
// Automatic tablet support
LoadingButton(
  onPressed: _handleSubmit,
  child: Text('Submit'),
  // Automatically adjusts size for tablets
)
```

## Migration Checklist

- [ ] Update package version in `pubspec.yaml`
- [ ] Replace direct style properties with `LoadingButtonStyle` object
- [ ] Update button type specification (if using typed constructors)
- [ ] Change `loadingChild` to `loadingWidget`
- [ ] Change `successChild` to `successWidget`
- [ ] Change `errorChild` to `errorWidget`
- [ ] Update state callback parameter type to `ButtonState`
- [ ] Move error handling to `onError` callback
- [ ] Update duration property names
- [ ] Test all button states and animations
- [ ] Verify accessibility features work correctly

## Common Issues and Solutions

### Issue 1: Style Properties Not Working

**Problem:** Direct style properties like `color`, `textColor` not working.

**Solution:** Wrap all style properties in `LoadingButtonStyle`:

```dart
// Wrong
LoadingButton(
  color: Colors.blue,
  textColor: Colors.white,
)

// Correct
LoadingButton(
  style: LoadingButtonStyle(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
)
```

### Issue 2: Constructor Not Found

**Problem:** `LoadingButton.elevated()` constructor not found.

**Solution:** Use type parameter or builder pattern:

```dart
// Option 1: Type parameter
LoadingButton(
  type: ButtonType.elevated,
  // ...
)

// Option 2: Builder pattern
LoadingButtonBuilder.elevated()
  // ...
  .build()
```

### Issue 3: State Callback Type Error

**Problem:** State parameter type error in `onStateChanged`.

**Solution:** Use proper enum type:

```dart
// Wrong
onStateChanged: (state) {
  if (state == 'loading') { ... }
}

// Correct
onStateChanged: (ButtonState state) {
  if (state == ButtonState.loading) { ... }
}
```

### Issue 4: Animation Not Smooth

**Problem:** Animations appear jerky or not smooth.

**Solution:** Use global configuration or specify duration:

```dart
// Global setting
LoadingButtonConfig().defaultAnimationDuration = Duration(milliseconds: 300);

// Or per button
LoadingButton(
  animationDuration: Duration(milliseconds: 300),
  // ...
)
```

## Benefits of Migration

1. **Better Error Handling**: Automatic error catching and handling
2. **Improved Performance**: Optimized animations and memory usage
3. **Enhanced Accessibility**: Built-in screen reader support
4. **Cleaner API**: Consistent naming and structure
5. **Better Maintainability**: Separated concerns and modular design
6. **Responsive Design**: Automatic tablet support
7. **Type Safety**: Strong typing with null safety
8. **Customization**: More styling options and configurations

## Getting Help

If you encounter issues during migration:

1. Check the [API documentation](https://pub.dev/packages/loading_button)
2. Look at the [example app](https://github.com/yourusername/loading_button/tree/main/example)
3. Open an issue on [GitHub](https://github.com/yourusername/loading_button/issues)

## Final Notes

- The migration is designed to be straightforward with minimal breaking changes
- Most changes are simple property renames and restructuring
- The new API is more consistent and easier to use
- All previous functionality is preserved with enhancements
- Consider using the builder pattern for new implementations as it provides better IntelliSense support and cleaner code

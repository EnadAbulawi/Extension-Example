import 'package:flutter/material.dart';

/// --------------------
/// BuildContext Extensions
/// --------------------
extension ContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// إظهار SnackBar بسهولة
  void showSnackBar(
    String message, {
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor ?? theme.primaryColor,
        duration: duration,
      ),
    );
  }
}

/// --------------------
/// String Extensions
/// --------------------
extension StringExtensions on String {
  /// أول حرف كبير والباقي صغير
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// التحقق إذا النص إيميل
  bool get isEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
}

/// --------------------
/// DateTime Extensions
/// --------------------
extension DateTimeExtensions on DateTime {
  String toShortDate() =>
      "${day.toString().padLeft(2, '0')}/"
      "${month.toString().padLeft(2, '0')}/$year";

  String toTime() =>
      "${hour.toString().padLeft(2, '0')}:"
      "${minute.toString().padLeft(2, '0')}";
}

/// --------------------
/// Widget Padding Extensions
/// --------------------
extension WidgetPadding on Widget {
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  Widget paddingSymmetric({double vertical = 0, double horizontal = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: this,
      );

  /// إضافة SafeArea بسرعة
  Widget withSafeArea({bool top = true, bool bottom = true}) =>
      SafeArea(top: top, bottom: bottom, child: this);
}

/// --------------------
/// Color Extensions
/// --------------------
extension ColorExtensions on Color {
  /// إنشاء لون من HEX مثل: ColorExtensions.fromHex("#FF5733")
  static Color fromHex(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// إنشاء لون من RGB
  static Color fromRGB(int r, int g, int b) => Color.fromRGBO(r, g, b, 1.0);
}

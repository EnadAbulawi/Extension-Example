import 'package:flutter/material.dart';
import 'extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extensions Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String email = "test@example.com";
    String text = "flutter";

    return Scaffold(
      appBar: AppBar(title: const Text('Extensions Demo')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// مثال على ContextExtensions
            Container(
              color: Colors.amber,
              width: context.screenWidth,
              height: 50,
              child: Center(
                child: Text(
                  "عرض الشاشة: ${context.screenWidth.toStringAsFixed(1)}",
                  style: context.textTheme.bodyLarge,
                ),
              ),
            ).paddingAll(10),

            /// مثال على StringExtensions
            Text("كلمة قبل التعديل: $text").paddingAll(8),
            Text("بعد capitalize: ${text.capitalize()}").paddingAll(8),
            Text("هل الإيميل صحيح؟ ${email.isEmail}").paddingAll(8),

            /// مثال على DateTimeExtensions
            Text("التاريخ: ${now.toShortDate()}").paddingAll(8),
            Text("الوقت: ${now.toTime()}").paddingAll(8),

            /// مثال على WidgetPadding + SafeArea
            Text(
              "هذا النص داخل SafeArea مع Padding",
            ).paddingAll(16).withSafeArea(),

            /// مثال على ColorExtensions
            Container(
              height: 50,
              width: 100,
              color: ColorExtensions.fromHex("#3498db"),
              child: const Center(child: Text("HEX")),
            ).paddingAll(10),

            Container(
              height: 50,
              width: 100,
              color: ColorExtensions.fromRGB(255, 0, 0),
              child: const Center(child: Text("RGB")),
            ).paddingAll(10),

            /// زر لعرض SnackBar
            ElevatedButton(
              onPressed: () {
                context.showSnackBar(
                  "مرحبا! هذه رسالة SnackBar باستخدام Extension",
                );
              },
              child: const Text("أظهر SnackBar"),
            ).paddingAll(20),
          ],
        ),
      ),
    );
  }
}

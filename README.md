# Flutter Extensions Demo 🚀

مشروع تجريبي بسيط يوضح كيف يمكن استخدام **Dart Extensions** في مشاريع Flutter 
لتقليل الأكواد المكررة، وزيادة الإنتاجية، وتسهيل القراءة والصيانة.

---

## 📌 ما هي الـ Extensions في Dart؟
الـ **Extensions** هي طريقة لإضافة وظائف جديدة لأي كلاس موجود (حتى لو لم تقم أنت بكتابته) 
بدون الحاجة لعمل **inheritance** أو **modification** على الكود الأصلي.  
مثال: بدل ما تكتب:
```dart
MediaQuery.of(context).size.width

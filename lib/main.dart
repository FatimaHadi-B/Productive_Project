import 'package:flutter/material.dart';
import 'login.dart'; // استدعاء صفحة اللوق إن

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FirstForm Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const LoginPage(), // الصفحة الأولى هي صفحة اللوق إن
    );
  }
}

// -----------------------------------
// صفحة الفورم (StoreFormPage)
// يمكنك تعديلها كما تريد
// -----------------------------------

class StoreFormPage extends StatefulWidget {
  const StoreFormPage({super.key});

  @override
  _StoreFormPageState createState() => _StoreFormPageState();
}

class _StoreFormPageState extends State<StoreFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController storeDescController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController openTimeController = TextEditingController();
  final TextEditingController closeTimeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إضافة بيانات المتجر"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Store Name
              const Text("اسم المتجر:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: storeNameController,
                decoration: const InputDecoration(hintText: "أدخل اسم المتجر"),
                validator: (value) => (value == null || value.isEmpty) ? "هذا الحقل مطلوب" : null,
              ),
              const SizedBox(height: 20),

              // Store Description
              const Text("وصف المتجر:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: storeDescController,
                minLines: 3,
                maxLines: 5,
                decoration: const InputDecoration(hintText: "أدخل وصفًا مختصرًا عن المتجر"),
                validator: (value) => (value == null || value.isEmpty) ? "هذا الحقل مطلوب" : null,
              ),
              const SizedBox(height: 20),

              // Owner Name
              const Text("اسم المالك:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: ownerNameController,
                decoration: const InputDecoration(hintText: "اسم مالك المتجر"),
              ),
              const SizedBox(height: 20),

              // Phone
              const Text("رقم التواصل:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(hintText: "مثال: 05xxxxxxxx"),
                validator: (value) => (value == null || value.isEmpty) ? "يرجى إدخال رقم التواصل" : null,
              ),
              const SizedBox(height: 20),

              // Email
              const Text("البريد الإلكتروني:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: "example@email.com"),
              ),
              const SizedBox(height: 20),

              // Location
              const Text("الموقع:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(hintText: "أدخل موقع المتجر (رابط خرائط أو نص)"),
              ),
              const SizedBox(height: 20),

              // Open Time
              const Text("وقت الافتتاح:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: openTimeController,
                decoration: const InputDecoration(hintText: "مثال: 8:00 AM"),
              ),
              const SizedBox(height: 20),

              // Close Time
              const Text("وقت الإغلاق:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: closeTimeController,
                decoration: const InputDecoration(hintText: "مثال: 11:00 PM"),
              ),
              const SizedBox(height: 20),

              // Category
              const Text("نوع المتجر / التصنيف:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: categoryController,
                decoration: const InputDecoration(hintText: "مثال: مقهى / ملابس / إلكترونيات"),
              ),
              const SizedBox(height: 20),

              // Notes
              const Text("ملاحظات إضافية:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: notesController,
                minLines: 2,
                maxLines: 4,
                decoration: const InputDecoration(hintText: "أدخل أي ملاحظات تود إضافتها"),
              ),
              const SizedBox(height: 30),

              // Submit Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("تم حفظ البيانات بنجاح")),
                      );
                    }
                  },
                  child: const Text("حفظ البيانات"),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

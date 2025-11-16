import 'package:flutter/material.dart';

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
      home: StoreFormPage(), // الصفحة الرئيسية فورم
    );
  }
}

class StoreFormPage extends StatefulWidget {
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
        title: Text("إضافة بيانات المتجر"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Store Name
              Text("اسم المتجر:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: storeNameController,
                decoration: InputDecoration(hintText: "أدخل اسم المتجر"),
                validator: (value) => (value == null || value.isEmpty) ? "هذا الحقل مطلوب" : null,
              ),
              SizedBox(height: 20),

              // Store Description
              Text("وصف المتجر:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: storeDescController,
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(hintText: "أدخل وصفًا مختصرًا عن المتجر"),
                validator: (value) => (value == null || value.isEmpty) ? "هذا الحقل مطلوب" : null,
              ),
              SizedBox(height: 20),

              // Owner Name
              Text("اسم المالك:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: ownerNameController,
                decoration: InputDecoration(hintText: "اسم مالك المتجر"),
              ),
              SizedBox(height: 20),

              // Phone
              Text("رقم التواصل:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: "مثال: 05xxxxxxxx"),
                validator: (value) => (value == null || value.isEmpty) ? "يرجى إدخال رقم التواصل" : null,
              ),
              SizedBox(height: 20),

              // Email
              Text("البريد الإلكتروني:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: "example@email.com"),
              ),
              SizedBox(height: 20),

              // Location
              Text("الموقع:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: locationController,
                decoration: InputDecoration(hintText: "أدخل موقع المتجر (رابط خرائط أو نص)"),
              ),
              SizedBox(height: 20),

              // Open Time
              Text("وقت الافتتاح:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: openTimeController,
                decoration: InputDecoration(hintText: "مثال: 8:00 AM"),
              ),
              SizedBox(height: 20),

              // Close Time
              Text("وقت الإغلاق:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: closeTimeController,
                decoration: InputDecoration(hintText: "مثال: 11:00 PM"),
              ),
              SizedBox(height: 20),

              // Category
              Text("نوع المتجر / التصنيف:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(hintText: "مثال: مقهى / ملابس / إلكترونيات"),
              ),
              SizedBox(height: 20),

              // Notes
              Text("ملاحظات إضافية:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: notesController,
                minLines: 2,
                maxLines: 4,
                decoration: InputDecoration(hintText: "أدخل أي ملاحظات تود إضافتها"),
              ),
              SizedBox(height: 30),

              // Submit Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("تم حفظ البيانات بنجاح")),
                      );
                    }
                  },
                  child: Text("حفظ البيانات"),
                ),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

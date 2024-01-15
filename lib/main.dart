import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String name = 'Name to be displayed here';

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // nameController.text = 'USA';
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Textfield in Flutter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                nameController: nameController,
                hint: "Please enter your name",
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 30),
              AppTextField(
                  nameController: numberController,
                  hint: "Please enter your number",
                  keyboardType: TextInputType.phone,
                  ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    name = 
                    '${nameController.text} - ${numberController.text}';
                  });
                },
                child: Text('Submit'),
              ),
              Text('$name')
            ],
          ),
        ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.nameController,
      required this.hint,
      required this.keyboardType});

  final TextEditingController nameController;
  final String hint;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      textAlign: TextAlign.center,
      keyboardType: keyboardType,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.red),
      // obscureText: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 225, 207, 15)
          )
        ),
        
        border: OutlineInputBorder(),
        labelText: hint,
        labelStyle: TextStyle(color: Colors.blue),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const[
            CustomTextField(label: 'Name', icon: Icons.person,),
            SizedBox(height: 16,),
            CustomTextField(label: 'Email', icon: Icons.mail,),
            SizedBox(height: 16,),
            CustomTextField(label: 'Passoword', icon: Icons.vpn_key,),
            SizedBox(height: 16,),
            CustomTextField(label: 'Confirm Passoword', icon: Icons.vpn_key, hint: 'confirm passoword...',),
            SizedBox(height: 32,)
            // ElevatedButton.icon(
            //   onPressed: () {}, 
            //   icon: Icon(Icons.save), 
            //   label: Text('Salvar'),
            // ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData? icon;

  const CustomTextField({Key? key, required this.label, this.icon, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint == null ? 'Type your $label...' : hint ,
        border: const OutlineInputBorder(),
        prefixIcon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
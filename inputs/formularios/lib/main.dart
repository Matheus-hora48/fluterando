import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const CustomTextField(
                label: 'Name',
                icon: Icons.person,
                validator: (text) => text == null || text.isEmpty
                    ? 'This field cannot be null'
                    : null,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextField(
                label: 'Email',
                icon: Icons.mail,
                validator: (text){
                  if(text == null || text.isEmpty)
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextField(
                label: 'Passoword',
                icon: Icons.vpn_key,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextField(
                label: 'Confirm Passoword',
                icon: Icons.vpn_key,
                hint: 'confirm passoword...',
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    }
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                  onPressed: () {
                    formKey.currentState?.reset();
                  },
                  icon: const Icon(Icons.cancel),
                  label: const Text('Reset'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData? icon;
  final String? Function(String text)? validator;
  final void Function(String? text)? onSaved;

  const CustomTextField(
      {Key? key,
      required this.label,
      this.icon,
      this.hint,
      this.validator,
      this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'This field cannot be null';
        }
      },
      onSaved: (text) {},
      decoration: InputDecoration(
        labelText: label,
        hintText: hint ?? 'Type your $label...',
        border: const OutlineInputBorder(),
        prefixIcon: icon == null ? null : Icon(icon),
      ),
    );
  }
}

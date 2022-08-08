import 'package:flutter/material.dart';

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
  var size = 100.0;
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isLoading = !isLoading;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(microseconds: 800),
            curve: Curves.easeOut,
            height: 80,
            width: isLoading ? 80 : 300,
            decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(isLoading? 40 : 12),
            ),
            alignment: Alignment.center,
            child: AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              firstChild: const Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              secondChild: const Text('Teste', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              crossFadeState: isLoading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            )
          ),
        ),
      ),
    );
  }
}
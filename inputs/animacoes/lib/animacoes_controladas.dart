import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Controladas extends StatefulWidget {
  const Controladas({Key? key}) : super(key: key);

  @override
  State<Controladas> createState() => _ControladasState();
}

class _ControladasState extends State<Controladas>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}

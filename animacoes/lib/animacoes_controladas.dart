import 'dart:ffi';

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
  late final Animation<double> squadSize;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    squadSize = Tween<double>(begin: 100, end: 400).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            if(controller.value > 0){
              controller.reverse();
            } else {
              controller.forward();
            }
          },
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, snapshot) {
              return Container(
                height: squadSize.value,
                width: squadSize.value,
                color: Colors.redAccent,
              );
            }
          ),
        ),
      ),
    );
  }
}

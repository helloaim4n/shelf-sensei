import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerButton extends StatelessWidget {
  final ZoomDrawerController controller;

  const DrawerButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        controller.toggle?.call();
      },
    );
  }
}

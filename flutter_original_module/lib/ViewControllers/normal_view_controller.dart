import 'package:flutter/material.dart';
import 'package:flutter_original_module/ViewControllers/navigation_view_controller.dart';

class NormalViewController extends StatelessWidget {
  const NormalViewController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return navigationViewController(
        const Center(
          child: Text(
            "NormalViewController",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        context,title: "Normal");
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_original_module/ViewControllers/navigation_view_controller.dart';

class ParameterViewController extends StatefulWidget {
  const ParameterViewController({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  _ParameterViewControllerState createState() =>
      _ParameterViewControllerState();
}

class _ParameterViewControllerState extends State<ParameterViewController> {
  @override
  Widget build(BuildContext context) {
    return navigationViewController(
        Center(
          child: Text(widget.title,
              style: const TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              )),
        ),
        context,title: "Parameter");
  }
}

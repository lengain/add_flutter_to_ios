import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_original_module/ViewControllers/navigation_view_controller.dart';
import 'package:flutter_original_module/page_router.dart';

class CallbackViewController extends StatefulWidget {
  const CallbackViewController({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  _CallbackViewControllerState createState() =>
      _CallbackViewControllerState();
}

class _CallbackViewControllerState extends State<CallbackViewController> {
  @override
  Widget build(BuildContext context) {
    return navigationViewController(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.title,
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  )),
              const SizedBox(height: 10,),
              CupertinoButton(child: const Text("回调"), onPressed: (){
                PageRouterMethodChannelManager.defaultManager().methodChannel?.invokeMethod("callback",[
                  "Flutter message 1",
                  "Flutter message 2"
                ]);
              }),
              const SizedBox(height: 10,),
              CupertinoButton(child: const Text("original list"), onPressed: (){
                PageRouterMethodChannelManager.defaultManager().methodChannel?.invokeMethod("original");
              }),
            ],
          ),
        ),
        context, title: "Callback");
  }
}
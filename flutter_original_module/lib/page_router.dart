import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_original_module/ViewControllers/normal_view_controller.dart';
import 'package:flutter_original_module/ViewControllers/parameter_view_controller.dart';

import 'ViewControllers/callback_view_controller.dart';

class PageRouterMethodChannelManager {
  MethodChannel? methodChannel;
  PageRouterMethodChannelManager._internal();
  static final PageRouterMethodChannelManager _singleton = PageRouterMethodChannelManager._internal();
  factory PageRouterMethodChannelManager() => _singleton;
  static PageRouterMethodChannelManager defaultManager() => _singleton;
}


class PageRouterViewController extends StatefulWidget {
  const PageRouterViewController({Key? key}) : super(key: key);
  @override
  _PageRouterViewControllerState createState() => _PageRouterViewControllerState();
}

class _PageRouterViewControllerState extends State<PageRouterViewController> {
  late MethodChannel _channel;
  MethodCall? _methodCall;

  @override
  void initState() {
    super.initState();
    _channel = const MethodChannel('page-router');
    PageRouterMethodChannelManager.defaultManager().methodChannel = _channel;
    _channel.setMethodCallHandler((call) async {
      setState(() {
        _methodCall = call;
      });
    });
  }

  // void _incrementCounter() {
  //   // Mutations to the data model are forwarded to the host platform.
  //   _channel.invokeMethod<void>("incrementCount", _counter);
  // }

  Widget _routerResultView() {
    if (_methodCall != null) {
      switch (_methodCall!.method) {
        case "normal":
          return const NormalViewController();
        case "parameter":
          return ParameterViewController(title: _methodCall!.arguments as String);
        case "callbackView":
          return CallbackViewController(title: _methodCall!.arguments as String);
        default:
          return Container();
      }
    }else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: _routerResultView(),
    );
  }
}
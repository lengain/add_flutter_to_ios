import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_original_module/page_router.dart';

CupertinoPageScaffold navigationViewController(
    Widget child, BuildContext context,
    {String? title,bool hideBackButton = false, VoidCallback? backAction}) {
  return CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: Text(
        title ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: hideBackButton
          ? null
          : CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(Icons.arrow_back_ios,
              size: 20, color: Theme.of(context).primaryColor),
          onPressed: backAction ?? () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }else {
              PageRouterMethodChannelManager.defaultManager().methodChannel?.invokeMethod("backButtonAction");
            }
          }),
    ),
    child: child,
  );
}

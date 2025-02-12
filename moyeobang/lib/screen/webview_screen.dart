import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:moyeobang/common/app_colors.dart';
import 'package:moyeobang/controller/webview_controller.dart';
import 'package:moyeobang/widget/webview_widget.dart';

/// 웹뷰 화면
class WebViewScreen extends GetView<WebViewController> {
  const WebViewScreen(this.initUrl, {super.key});

  /// 초기 URL
  final URLRequest initUrl;

  @override
  Widget build(BuildContext context) {
    /// getXController => 웹뷰 컨트롤러 주입
    Get.put(WebViewController(), permanent: true);

    /// 웹뷰 스크린
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
            child: PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) async {
                  final shouldExit = await controller.handleBackPress(context);
                  if (shouldExit) {
                    SystemNavigator.pop();
                  }
                },
                child: Column(children: <Widget>[
                  Expanded(
                    child: Stack(children: [
                      /// 중단 - 웹뷰
                      WebViewWidget(initUrl: initUrl),
                    ]),
                  ),
                ]))));
  }
}

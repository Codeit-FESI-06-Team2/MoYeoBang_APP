import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  State<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    super.initState();

    // 네이티브 스플래시 제거
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF6659F4),
        child: Stack(
          children: [

            // 이미지 - 중앙 배치
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.7,
                child: Image.asset(
                  'assets/image/splash_main.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // 텍스트 - 이미지 아래쪽 공간의 중앙에 배치
            Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height * 0.10,
              child: const Text(
                '방탈출 팀원을 구할땐?\n여기로 모여방',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

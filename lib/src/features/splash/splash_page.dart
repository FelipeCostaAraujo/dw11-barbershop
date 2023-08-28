import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;
  double get _logoAnimationWidget => 100 * _scale;
  double get _logoAnimationHeight => 120 * _scale;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image_chair.jpg'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: AnimatedOpacity(
          opacity: _animationOpacityLogo,
          duration: const Duration(seconds: 3),
          curve: Curves.easeIn,
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              curve: Curves.linearToEaseOut,
              height: _logoAnimationHeight,
              width: _logoAnimationWidget,
              child: Image.asset(
                'assets/images/imgLogo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

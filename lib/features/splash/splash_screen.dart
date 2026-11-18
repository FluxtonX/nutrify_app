import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/theme/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const logoAsset = 'assets/images/nutrify_logo.png';
  static const loaderAsset = 'assets/images/splash_loader.png';

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemOverlay,
      child: Scaffold(
        body: SizedBox.expand(
          // Responsive policy: uniformly contain the reference canvas, centered
          // in the full viewport. White margins accommodate other aspect ratios.
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: 440,
              height: 956,
              child: Stack(
                children: [
                  Positioned(
                    left: 147,
                    top: 405,
                    width: 146,
                    height: 146,
                    child: Image.asset(
                      logoAsset,
                      key: const ValueKey('splash-logo'),
                      fit: BoxFit.contain,
                      semanticLabel: 'Nutrify',
                    ),
                  ),
                  Positioned(
                    left: 185,
                    top: 785,
                    width: 60,
                    height: 60,
                    child: Semantics(
                      label: 'Loading',
                      child: Image.asset(
                        loaderAsset,
                        key: const ValueKey('splash-loader'),
                        fit: BoxFit.contain,
                        excludeFromSemantics: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

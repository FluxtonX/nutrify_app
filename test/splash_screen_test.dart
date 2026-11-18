import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutrify/app/nutrify_app.dart';
import 'package:nutrify/app/theme/app_theme.dart';
import 'package:nutrify/features/splash/splash_screen.dart';

void main() {
  Future<void> showSplash(WidgetTester tester, Size size) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = size;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const NutrifyApp());
    await tester.pumpAndSettle();
  }

  testWidgets('bundles original PNGs with expected export dimensions',
      (tester) async {
    await tester.runAsync(() async {
      for (final entry in {
        SplashScreen.logoAsset: 512,
        SplashScreen.loaderAsset: 180,
      }.entries) {
        final bytes = await rootBundle.load(entry.key);
        final codec =
            await ui.instantiateImageCodec(bytes.buffer.asUint8List());
        final frame = await codec.getNextFrame();
        expect(frame.image.width, entry.value);
        expect(frame.image.height, entry.value);
        frame.image.dispose();
        codec.dispose();
      }
    });
  });

  testWidgets('matches reference bounds and uses original assets',
      (tester) async {
    await showSplash(tester, const Size(440, 956));
    final logo = find.byKey(const ValueKey('splash-logo'));
    final loader = find.byKey(const ValueKey('splash-loader'));
    expect(tester.getRect(logo), const Rect.fromLTWH(147, 405, 146, 146));
    expect(tester.getRect(loader), const Rect.fromLTWH(185, 785, 60, 60));
    expect((tester.widget<Image>(logo).image as AssetImage).assetName,
        SplashScreen.logoAsset);
    expect((tester.widget<Image>(loader).image as AssetImage).assetName,
        SplashScreen.loaderAsset);
    expect(Theme.of(tester.element(logo)).scaffoldBackgroundColor,
        AppColors.background);
    expect(find.text('9:41'), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(tester.takeException(), isNull);
  });

  for (final size in [
    const Size(320, 568),
    const Size(412, 892),
    const Size(768, 1024),
    const Size(956, 440),
  ]) {
    testWidgets('keeps artwork proportional and visible at $size',
        (tester) async {
      await showSplash(tester, size);
      final logo = tester.getRect(find.byKey(const ValueKey('splash-logo')));
      final loader =
          tester.getRect(find.byKey(const ValueKey('splash-loader')));
      expect(logo.center.dx, closeTo(size.width / 2, 0.01));
      expect(logo.center.dy, closeTo(size.height / 2, 0.01));
      expect(logo.width, closeTo(logo.height, 0.01));
      expect(loader.width / logo.width, closeTo(60 / 146, 0.001));
      expect(loader.center.dx, lessThan(logo.center.dx));
      expect(loader.top, greaterThan(logo.bottom));
      for (final rect in [logo, loader]) {
        expect(rect.left, greaterThanOrEqualTo(0));
        expect(rect.top, greaterThanOrEqualTo(0));
        expect(rect.right, lessThanOrEqualTo(size.width));
        expect(rect.bottom, lessThanOrEqualTo(size.height));
      }
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('provides semantics and stays static without invented routing',
      (tester) async {
    final semantics = tester.ensureSemantics();
    try {
      await showSplash(tester, const Size(440, 956));
      expect(find.bySemanticsLabel('Nutrify'), findsOneWidget);
      expect(find.bySemanticsLabel('Loading'), findsOneWidget);
      await tester.pump(const Duration(minutes: 1));
      expect(find.byType(SplashScreen), findsOneWidget);
      expect(tester.binding.hasScheduledFrame, isFalse);
      expect(tester.takeException(), isNull);
    } finally {
      semantics.dispose();
    }
  });
}

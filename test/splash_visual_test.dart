import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutrify/app/nutrify_app.dart';
import 'package:nutrify/features/splash/splash_screen.dart';

void main() {
  testWidgets(
      'rendered Splash matches exported artwork below native status bar',
      (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(440, 956);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final boundaryKey = GlobalKey();
    await tester.pumpWidget(RepaintBoundary(
      key: boundaryKey,
      child: const NutrifyApp(),
    ));
    final context = tester.element(find.byType(SplashScreen));
    await tester.runAsync(() async {
      await Future.wait([
        precacheImage(const AssetImage(SplashScreen.logoAsset), context),
        precacheImage(const AssetImage(SplashScreen.loaderAsset), context),
      ]);
    });
    await tester.pumpAndSettle();
    final boundary = boundaryKey.currentContext!.findRenderObject()!
        as RenderRepaintBoundary;
    await tester.runAsync(() async {
      final rendered = await boundary.toImage();
      final codec = await ui.instantiateImageCodec(
        await File('docs/figma/splash_reference.png').readAsBytes(),
      );
      final reference = (await codec.getNextFrame()).image;
      try {
        expect(rendered.width, reference.width);
        expect(rendered.height, reference.height);
        final actual = (await rendered.toByteData())!.buffer.asUint8List();
        final expected = (await reference.toByteData())!.buffer.asUint8List();
        var difference = 0;
        var samples = 0;
        // The Figma mock status bar is intentionally replaced by native UI.
        // Allow small rasterization differences along the PNG/vector edges.
        for (var y = 60; y < 956; y++) {
          for (var x = 0; x < 440; x++) {
            for (var channel = 0; channel < 3; channel++) {
              final index = (y * 440 + x) * 4 + channel;
              difference += (actual[index] - expected[index]).abs();
              samples++;
            }
          }
        }
        final png = await rendered.toByteData(format: ui.ImageByteFormat.png);
        await File('build/splash_preview.png')
            .writeAsBytes(png!.buffer.asUint8List());
        expect(difference / samples, lessThan(1.0),
            reason:
                'Mean RGB error must remain below 1/255 outside system UI.');
      } finally {
        rendered.dispose();
        reference.dispose();
        codec.dispose();
      }
    });
  });
}

# Splash implementation and verification

Recorded 2026-11-17, Asia/Karachi.

## Implemented

- Original logo PNG (512 × 512) and loader PNG (180 × 180) registered explicitly
  in `pubspec.yaml`. No new dependencies.
- `lib/app/nutrify_app.dart` supplies the app entry widget and reusable light
  theme from `lib/app/theme/app_theme.dart`.
- `lib/features/splash/splash_screen.dart` positions the logo at (147,405),
  146 × 146, and the loader at (185,785), 60 × 60, in a 440 × 956 canvas.
- Responsive implementation choice: uniform contain scaling centered in the
  viewport, with white margins for differing aspect ratios. Artwork is not
  stretched and the loader retains its five-unit left offset.
- Native status/navigation bars with dark icons and transparent backgrounds.
  Figma's mock 9:41 and system icons are not drawn. This is a Flutter screen;
  the platform's pre-Flutter launch-screen configuration was not customized.
- Loader remains static; no assumed animation timing, startup delay or routing.
- Accessibility labels identify Nutrify and Loading.

## Validation

Pinned FVM Flutter 3.24.4 / Dart 3.5.4 was used without SDK changes.

```sh
fvm flutter --no-version-check test --no-pub --reporter expanded
fvm flutter --no-version-check analyze --no-pub
fvm flutter --no-version-check run --no-pub -d emulator-5554 --no-resident
```

- All **8 tests passed**: bundled image decoding/dimensions; reference bounds and
  asset selection; four viewport sizes including landscape; semantics/static
  behavior; rendered image comparison with the user-supplied reference.
- Analyze: **No issues found**.
- Visual test excludes the top 60 pixels containing native status UI and requires
  mean RGB channel difference below 1 on the 0–255 scale. This allows raster edge
  differences and is not a claim of identical device rendering.
- The test writes `build/splash_preview.png`; the preview was visually inspected
  against `docs/figma/splash_reference.png`. Logo/loader composition matches.
- Debug build succeeded: `build/app/outputs/flutter-apk/app-debug.apk`.
- Initial launch failed with `adb: device offline`. This was resolved in the
  subsequent emulator verification below.

## Android emulator verification — 2026-11-17

- ADB restart alone did not recover the offline device. Pixel_8_API_35's hung
  QEMU process ignored SIGTERM and a shutdown grace period; only that process
  was force-stopped. Cold boot used `-no-snapshot-load -no-snapshot-save`.
  No AVD data wipe, SDK edit or snapshot deletion was performed.
- ADB returned `device`, `sys.boot_completed` returned `1`, and the shell
  responded. Screen: 1080 × 2400 physical pixels, density 420 dpi.
- The FVM launch command above completed successfully (exit 0): APK built,
  installed and Flutter synced. Foreground activity was
  `com.example.nutrify/.MainActivity`.
- Captured and visually inspected [emulator screenshot](figma/splash_emulator.png)
  against [Figma reference](figma/splash_reference.png). Original logo and static
  loader are visible with no clipping or distortion. No debug banner appears.

Observed differences:

1. Android's live time, notification/status icons and bottom gesture bar replace
   the reference's mock iOS-style 9:41 status row. Device icons appear dark gray;
   the reference mock icons are black. This is native system UI.
2. At 1080 × 2400, the 440 × 956 design is scaled by 1080/440 = 2.454545,
   leaving about 26.73 physical pixels of white margin above/below the contained
   design canvas. This is the documented responsive policy, not stretched art.
3. Thresholded visible teal bounds (left, top, right-exclusive, bottom-exclusive):
   reference logo (156,414,284,542), device logo (382,1042,698,1358);
   reference loader (189,789,241,841), device loader (465,1964,591,2091).
   These are visible ink measurements, not the full transparent asset bounds;
   small edge differences are rasterization/threshold effects.
4. Before Flutter's first frame, the Android launch screen briefly showed the
   default Flutter icon. The platform launch screen has not been branded in this
   task. The saved screenshot shows the final Nutrify Flutter screen.

The app intentionally remains on the static Splash; no animation or navigation
behavior was added. No implementation source changed during emulator recovery.

Earlier stalled validation processes were stopped. Tests were corrected to run
native PNG decoding outside the simulated test clock and dispose the semantics
handle before end-of-test verification. The final complete suite passed.

## Remaining scope

Android visual/system-bar review passed on this emulator. Native launch branding
was subsequently implemented on 2026-11-18; see [native launch verification](NATIVE_LAUNCH.md).
Earlier observations of the default Flutter launch icon above describe the
pre-branding build and are superseded by that report. Approved loader animation
and real startup routing remain pending. Other screens and iOS runtime verification
are outside this slice. No Figma MCP calls, SDK modification or automatic commit
was performed.

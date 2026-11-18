# Native launch branding

Completed 2026-11-18 (Asia/Karachi). Flutter Splash source was preserved byte for
byte, checked against hashes captured before this task.

## Android

- Legacy launch backgrounds use a white layer and centered original logo bitmap.
  Density variants in drawable-mdpi through drawable-xxxhdpi represent 146 dp:
  146, 219, 292, 438 and 584 pixels. They were resized from the original 512px PNG
  with macOS `sips`; the largest variant is an upscale, not new artwork.
- Android 12+ day/night LaunchTheme explicitly sets a white splash background
  and `windowSplashScreenAnimatedIcon` to a static PNG (no invented animation).
- The system asset is an 864 × 864 white canvas containing the original artwork
  resized to 438 × 438, centered. This corresponds to a 288 dp system canvas and
  146 dp logo. Padding protects the outer ring from Android's circular icon mask.
- Initial XML-layer padding was not respected as intended by the system splash
  renderer: the outer ring was clipped. The final padded raster was rebuilt,
  installed and verified with the complete ring visible.
- Day/night native backgrounds remain white, including NormalTheme. The launcher
  app icon is outside this launch-screen task and was not changed.

Android sizing reference:
[Android splash-screen specification](https://developer.android.com/develop/ui/views/launch/splash-screen).

## iOS

- `LaunchScreen.storyboard` references the new `NutrifyLaunchLogo` image set and
  uses `scaleAspectFit` on a white view.
- The asset is an exact byte copy of `assets/images/nutrify_logo.png`.
- Auto Layout centers the square image, with preferred width 146/440 of the view
  and maximum height 146/956 of the view. This follows the existing contained
  Flutter canvas proportion without hard-coding an iPhone screen size.
- Existing `UILaunchStoryboardName=LaunchScreen` remains unchanged.
- Storyboard XML and asset references checked. **iOS compilation and simulator/
  device verification remain pending**: `xcrun simctl list runtimes` returned no
  installed runtimes; device list contains unavailable iOS 17.2 only.

Apple reference:
[Specifying your app's launch screen](https://developer.apple.com/documentation/xcode/specifying-your-apps-launch-screen/).

## Verification

- Pinned FVM Flutter 3.24.4: analyze passed; all 8 existing widget/visual tests
  passed during the native implementation. No Dart changes followed these checks.
- Final padded Android asset: FVM build/install/run passed on Pixel_8_API_35
  (Android 15, emulator-5554). A separate force-stop + start returned
  `Status: ok`, `LaunchState: COLD`, `TotalTime: 6213` ms (debug emulator timing,
  not a production performance benchmark).
- [Native launch screenshot](figma/native_launch_android.png): complete Nutrify
  logo on white, no Flutter launch icon, no loader during the native phase.
- [Settled Flutter screenshot](figma/splash_after_native_android.png): unchanged
  logo/loader layout and original assets. Native Android bars remain visible.
- Native Android logo is fixed at 146 dp; the responsive Flutter canvas makes
  its logo slightly smaller on this display. A small size change at the transition
  is expected; no claim of pixel-identical native/Flutter geometry is made.
- Pre-Android-12 resources and dark-mode overrides were configured and packaged,
  but separate older-device and night-mode runtime captures were not performed.

No extra packages, SDK edits, Figma MCP calls or automatic commits.

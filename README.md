# Nutrify

Nutrition and wellness application targeting **Android and iOS**. The project is
in discovery and foundation development. The current app displays the first
Nutrify Splash screen using original exported logo/loader PNGs. It stays on Splash;
startup services, onward navigation and loader animation are not implemented.

The reusable theme and proportional layout use the verified 440 × 956 reference.
Other aspect ratios contain that canvas without stretching the artwork. Native
device status/navigation bars are used instead of the Figma mock clock/icons.
See [design evidence](FIGMA_DESIGN_SPEC.md) for verified measurements and the
distinction between measured properties and implementation decisions.

Android/iOS native launch screens now use the original Nutrify logo on white.
Android cold launch is verified; iOS runtime verification is pending. See
[native launch notes](docs/NATIVE_LAUNCH.md) for screenshots and platform limits.

## Project context

- Workspace: `/Users/mac/nutrify`; do not modify `practice_flutter`.
- [Master brief](NUTRIFY_CODEX_MASTER_BRIEF.md): primary context, including proposals
  and screenshot observations that are not automatically approved requirements.
- [Open questions](OPEN_QUESTIONS.md), [feature matrix](FEATURE_MATRIX.md) and
  [decisions](DECISIONS.md) track pending requirements and confirmed choices.
- Existing desktop/web scaffold files are preserved; those platforms are not
  confirmed delivery targets.

## Development baseline

Use FVM and the tracked `.fvmrc`: **Flutter 3.24.4 / Dart 3.5.4**.
Pinned revision: `603104015dd692ea3403755b55d07813d5cf8965`.
Local SDK: `/Users/mac/fvm/versions/3.24.4`.
This is the compatible **current development baseline, not the final production
SDK**. Plan and validate a supported production toolchain separately. Do not run
unplanned upgrades or edit Flutter framework source.

The last verified environment uses Intel macOS 13.7.8, Java 17 and Android SDK
build-tools 35.0.0. Local iOS testing remains blocked by the unavailable simulator
runtime on Xcode 15.2. A supported Mac/Xcode or cloud build plan is needed for iOS
release; official store requirements must be checked during release planning.

## Local verification

From the project root, using existing resolved dependencies:

```sh
cd /Users/mac/nutrify
fvm flutter --version
fvm flutter analyze --no-pub
fvm flutter test --no-pub
```

With the Android emulator already running:

```sh
fvm flutter run -d emulator-5554 --debug --no-pub --no-resident
```

Phase 0 SDK repair restored only `text.dart` from the pinned revision. Analysis,
the counter widget test and Android build/install/launch passed after that repair.
This does not establish Nutrify feature coverage or iOS functionality.

## Repository and secrets

Task 02 initializes local Git only: no remote, push or automatic commit.
Keep `.fvmrc`, `pubspec.lock`, source, tests and documentation in version control.
Build output, caches, SDK links, environment secrets, credentials, signing material
and `sdk-repair-backups/` are ignored. Repair backups remain on disk.
Review `git status --short` before staging. Ignore patterns cannot prevent secrets
in arbitrarily named files; never force-add secrets. Only placeholder values
belong in `.env.example` files. Privileged API keys must never ship in mobile
source, assets or build-time definitions.

Android/iOS identifiers remain `com.example.nutrify`; Android release currently
uses debug signing. These are not production configuration. Backend ownership and
provider selection remain unresolved; no backend integration is implemented.

## Proposed milestones

1. Review full Figma frames/assets and resolve blocking owner questions.
2. Validate the Splash slice; define startup routing and approve loader motion separately.
3. Establish navigation and onboarding, then approved backend/auth persistence.
4. Deliver tracking and analytics, then approved AI, subscriptions and other integrations.
5. Complete Android/iOS testing, accessibility, security, signing, store review and handover.

No UI implementation or dependency installation is included in Task 02.

# NUTRIFY APP — CODEX MASTER PROJECT BRIEF

**Purpose:** Single-source onboarding brief for Codex. Read this entire document before changing code.  
**Status:** Discovery / development foundation; NOT a completed product specification.  
**Primary language for implementation:** English. **Explain progress, mistakes, commands and decisions to developer in Roman Urdu.**

## 0. Mission and working relationship

Build and deliver **Nutrify**, a production-quality, fully functional nutrition and wellness mobile application for **Android and iOS**, based on the owner's Figma design. Scope covers requirements, UI implementation, architecture, backend, integrations, testing, security, release builds, deployment and handover. This is a real owner/company demonstration, not a UI-only prototype. The developer is a junior Flutter developer; act as a senior engineer, code reviewer and mentor. Correct errors proactively, explain *why*, keep code maintainable, and make each step verifiable. Do not claim an integration works until tested. Do not silently invent owner-approved requirements.

**Figma:** https://www.figma.com/design/xnjCwA3cccjppFgS89rxOA/Nutrify-App?node-id=0-1

Figma access was shown as **Anyone — can view**, but tool/API inspection by Codex has NOT been verified. The user supplied six design overview screenshots, summarized below. If these screenshots are not present in Codex's workspace, ask for exports or use authorized Figma access; never claim pixel-perfect fidelity without inspecting full-size frames and assets.

## 1. Confirmed facts vs proposals vs unknowns

### Confirmed by user
- Deliver on **both Android and iOS**.
- Design exists in Figma; app name **Nutrify**.
- Deliver **A-to-Z functionality**, not just screens, from development to deployment.
- Developer wants to perform most coding in **Codex** and receive senior-level guidance/review.
- Backend ownership/existence **not yet confirmed**.

### Observed in supplied Figma screenshots (visual evidence, not backend contract)
- Main Design page has sections titled **Splash Screen — 1 Screen**, **Detailed Onboarding Flow — 29 Screens**, **App Navigation After Payment — 27 Screens**. These header counts sum to 57, but 57 unique frames have NOT been independently inventoried. Some screenshots show only subsets or variants.
- Also a **Media Banners** page is visible in the Figma sidebar, but not audited.
- App visual language: white backgrounds, deep teal primary buttons/navigation, aqua accents, rounded cards, clean typography; final colors/fonts/measurements must be extracted from Figma.
- Screenshot text/numbers are mockup examples, not authoritative nutrition calculations or payment prices.

### Recommended, NOT owner-approved
- Mobile: Flutter/Dart, feature-first structure, Riverpod for state, GoRouter for navigation.
- Backend: Supabase (PostgreSQL, Auth, Storage, RLS) plus Python FastAPI for protected business logic/AI processing; evaluate whether simpler serverless functions suffice before adding a separate service.
- Subscriptions: App Store/Play Billing, optionally RevenueCat as an orchestration layer.
- AI recognition: vetted image/vision service PLUS reliable nutrition reference database; require human confirmation and correction.
- Git/GitHub, unit/widget/integration tests, CI/CD.

### Unknown — DO NOT fabricate
- Whether owner already has backend, API, database, Figma assets, brand guidelines, domain, accounts, AI provider, nutrition data licenses, payment provider, pricing/trials, budgets or API keys.
- Precise UX for errors, empty states, offline behavior, notifications, account recovery, moderation, referral payout and full community publishing.
- Formula/specification for calorie targets, BMI/BMR, macro targets, streaks, Nutrify Score, AI accuracy, weight projections.
- Target markets, privacy/legal text, data retention, health disclaimers, age restrictions, languages to actually support, app store ownership and launch schedule.
- Exact bundle IDs, organization identifier and store accounts.

## 2. Figma screen inventory (observed)

### A. Splash / onboarding / subscription
1. Splash: centered Nutrify logo, white background, teal spinner lower on screen.
2. Welcome: food-scanning hero image, Get Started, Sign in.
3. Choose Gender: Male/Female shown; validate owner requirements for inclusivity and data use.
4. Height & Weight: imperial/metric toggle and wheel/picker values (two variants).
5. Date of Birth / age picker.
6. Informational stat/weight-loss screens.
7. Primary fitness goal: Lose Weight, Gain Muscle, Maintain Weight.
8. Exercise frequency: minimal/moderate/high activity.
9. Diet preference: Classic, Pescatarian, Vegetarian, Vegan.
10. Goal obstacles: consistency, unhealthy habits, busy schedule, motivation.
11. Target/desired weight picker.
12. Weight-loss speed per week selector.
13. Motivational information screens: Start Losing Weight Today; Ultimate Guide to Gaining Weight; Journey to Weight Maintenance; Leave a Review.
14. Completion / loading / plan generation screens; custom plan showing calories, protein, carbs, fat, Nutrify score and tips.
15. Referral code entry, optional skip.
16. Create Account: Google and Apple sign-up options shown.
17. Payment Wall 1–4: marketing/scanning carousel and monthly/yearly pricing; free-for-X-users promotional variant. Prices and offer conditions NOT validated.

### B. Main app after payment
18. Home: greeting/profile, day/week strip, current weight, daily calorie goal gauge, macro summaries, meal/activity cards.
19. Central plus action sheet: Log Exercise, Saved Food, Describe Food, Scan.
20. Streak page: current/longest/green streak and calendar.
21. Analytics: current and desired weight, BMI/BMR/LBM tabs, progress charts and goal trends.
22. Settings: burned calories/metric toggles; personal details; adjust goals; language; terms/privacy/support; unsubscribe, logout; referral balance.
23. Personal details: image, name, age, current weight, height, gender, desired weight.
24. Referral: referral code copy, invited users and reward values (mock data).
25. Adjust Goals: calorie/protein/carbs/fats display, edit dialog, auto-generate goals.
26. Support Email.
27. Language picker: English, Español, Chinese, Português, Deutsch, Italiano shown (do not assume translations exist).
28. Logout confirmation.
29. Cancellation flow: reason for leaving, retention offer, unsubscribe.
30. Privacy Policy and Terms & Conditions screens (placeholder copy visible, not approved legal content).

### C. Food, exercise and recipes
31. Scanning best-practices/instructions modal.
32. Camera scanning view.
33. Scanning Details: detected meal, quantity, nutrients, Nutrify Score, ingredient list, save, AI refine.
34. Delete ingredient confirmation.
35. Edit ingredient dialog.
36. Describe Food: manual description and microphone/speech input, optional save.
37. Log Exercise: exercise type, intensity, duration, optional distance.
38. Select from saved foods.
39. Recipe tab: Your Recipe and Community.
40. Recipe Details: food image, portion, calories, nutrients, score, ingredients, instructions, Save.

These are functional screen groups/variants identified from screenshots, NOT an exhaustive frame-by-frame list. Codex must create a canonical inventory from Figma and note missing frames.

## 3. Functional requirements by module

**Splash & routing:** app initialization, session restoration, onboarding-complete and entitlement checks, navigation to appropriate next screen; avoid fake delays as business logic.

**Onboarding:** persist answers; validate ranges and units; handle back/forward, progress and resume; goal calculation must use approved formula and age/health guardrails; provide user review/edit.

**Authentication:** Google and Apple sign-in for supported platforms, secure session handling, sign-out, account deletion, failure/retry; define returning-user experience. Avoid storing tokens insecurely.

**Subscriptions:** store-compliant in-app purchases for digital features, server-verified entitlement state, trial/renewal/cancellation/restore purchases, cross-device synchronization, refund/revocation; prices and free-tier access require owner decision. RevenueCat is optional, not a substitute for store policies.

**Home / daily log:** date navigation, calorie/macro totals, meals, exercise and current weight; all values derived from real records, with timezone/day-boundary rules, loading/error/empty states.

**Food tracking:** food lookup and manual description, portions/units, meal categorization, saved foods, editing/deleting logs, nutritional totals, duplicate prevention, data provenance. Food images should have storage/privacy rules.

**AI food scanning:** camera permission, capture/upload, recognition, candidate ingredients, estimated serving sizes and nutrients, confidence/uncertainty, user correction, retry/error handling, optional AI refine. Never present estimated nutritional data as guaranteed fact. AI keys server-side only; prevent abuse/cost spikes.

**Exercise:** exercise type, intensity, duration, distance, calculated/entered energy with transparent estimates, save/edit/delete.

**Recipes:** user's saved recipes, community listings, recipe detail, ingredient/portion calculation, save; clarify who can publish, moderate, report or edit community recipes.

**Analytics:** BMI/BMR/lean body mass only with validated inputs and approved formulas; trends from stored records; meaningful date filters, units and empty states; avoid presenting projections as medical facts.

**Profile/settings:** personal details, goal adjustment, measurement units, language (only ship translated languages), support, legal pages, logout, deletion, subscription management.

**Referrals:** code generation/copy, attribution, eligible rewards, invited user list, anti-abuse checks; do not assume cash payouts based on mockup.

**Quality/accessibility:** responsive Android/iOS layouts, safe areas, dynamic text, screen-reader labels, permission rationale, dark-mode behavior if required, analytics/crash reporting only with appropriate privacy disclosures.

## 4. Architecture proposal

```text
Flutter Android/iOS app
  ├── Presentation: screens/widgets + Riverpod controllers
  ├── Domain: entities, use cases, validation, repository contracts
  └── Data: repositories, DTOs, Supabase client, API client
          ├── Supabase Auth + PostgreSQL (RLS) + Storage
          ├── FastAPI (secure business logic, AI orchestration, webhooks)
          │      └── vision provider + nutrition database
          └── StoreKit / Google Play Billing (optionally RevenueCat)
```

Keep privileged credentials out of mobile bundles. Use Supabase RLS for user-owned records, database constraints and migrations, validated FastAPI endpoints, idempotency for purchases/webhooks, rate limits and audit logging. Avoid a separate backend service until its operational need is justified. Document all architectural trade-offs.

### Preliminary tables (NOT final schema)
`profiles`, `onboarding_answers`, `user_goals`, `nutrition_targets`, `foods`, `food_logs`, `food_log_items`, `exercise_logs`, `weight_logs`, `recipes`, `recipe_ingredients`, `saved_foods`, `user_streaks`, `referrals`, `subscription_entitlements`; potentially `scan_jobs`, `food_images`, `referral_events`, `purchase_events`. Design PK/FK, owner IDs, timestamps, indexes, unique constraints, RLS, and migration/rollback plan before implementation.

### Suggested Flutter layout
```text
lib/
  app/{app.dart,router/,theme/}
  core/{constants/,errors/,network/,widgets/,utils/}
  features/
    splash/
    onboarding/
    auth/
    subscriptions/
    home/
    food_tracking/
    exercise/
    analytics/
    recipes/
    referrals/
    profile/
  main.dart
assets/{images/,icons/,fonts/}
test/
integration_test/
android/
ios/
```

Apply domain/data/presentation subfolders where complexity justifies them; don't create ceremonial layers with no use. Prefer reusable components, typed models, robust error handling and testability.

## 5. Developer's actual local environment and troubleshooting history

**Mac:** Intel x64 Mac, **macOS 13.7.8 Ventura** (previous transient error reported OS 13.0).  
**Flutter working:** `3.24.4` (Dart `3.5.4`) at `/Users/mac/fvm/versions/3.24.4`; FVM installed.  
**Other cached FVM versions:** 3.35.0, 3.27.2, 3.27.1 (global at time of check), 3.19.2.  
**Android:** Android SDK at `/Users/mac/Library/Android/sdk`, Android SDK build-tools 35.0.0, Java 17, licenses accepted; Android Studio 2024.1.  
**Emulator:** `emulator-5554`, Android 15/API 35, x86_64, successfully connected and ran a Flutter app.  
**Editor:** VS Code, Codex extension installed.  
**iOS:** Xcode 15.2 (15C500b), CocoaPods 1.16.2; `flutter doctor -v` reported **Unable to get list of installed Simulator runtimes**. `xcrun simctl list devices available` returned unavailable `com.apple.CoreSimulator.SimRuntime.iOS-17-2`. No working iOS simulator yet. Current macOS/Xcode are too old for modern App Store submission requirements; plan supported newer macOS/Xcode or CI/cloud Mac, validate official requirements at release time.

**Important history:** A newer Flutter/Dart tool failed with `VM initialization failed: Current Mac OS X version 13.0 is lower than minimum supported version 14.0`. Switching to Flutter 3.24.4 resolved CLI startup. Do NOT run unplanned `flutter upgrade` or delete SDK caches. Pin project version with FVM and test package compatibility. Long-term modern toolchain upgrade is necessary for production.

**Repository confusion:** The last VS Code screenshot showed **`PRACTICE_FLUTTER`** open and a nutrition dashboard running, NOT evidence that the new Nutrify repository is open. User said steps 1–7 completed, but `~/development/nutrify` creation and its default app launch are NOT independently verified. **Do not modify `practice_flutter`**. First inspect actual working directory/repo and confirm which project is open. If `~/development/nutrify` does not exist, ask before creating it; avoid overwriting anything. `com.example` is only a placeholder organization ID, not an approved production bundle ID.

Useful read-only diagnostics:
```bash
pwd
ls -la
which flutter
fvm list
fvm flutter --version
flutter devices
xcodebuild -version
xcrun simctl list devices available
git status --short
```

## 6. Work order / milestones

**Phase 0 — Repo and design audit (FIRST):** Confirm actual repo root; inspect existing code and git state, verify SDK/FVM, inspect Figma frames/assets (or request exports), produce screen inventory, user-flow map, requirements matrix, unknowns and owner decisions. Never replace the practice app accidentally.

**Phase 1 — Foundation:** Set up dedicated Nutrify repo, safe org/bundle ID plan, FVM pin, linting, Git, environments/secrets handling, theme/design tokens, navigation skeleton, baseline tests. Verify Android emulator build. Keep iOS limitations visible.

**Phase 2 — UI flow:** Splash, welcome, onboarding, auth entry and paywall layouts with proper validation and navigation. Use placeholder/mock services only when explicitly labeled and easily replaceable.

**Phase 3 — Data/auth:** Backend selection after owner review, schema migrations, RLS, Auth, onboarding persistence, profile and goal CRUD, unit tests.

**Phase 4 — Tracking and analytics:** Daily dashboard, food logs, saved foods, exercises, recipes, weight history, formulas and charts.

**Phase 5 — Advanced integrations:** AI scanning + correction, subscriptions/entitlements, referrals and community logic; implement against real provider accounts and test environments.

**Phase 6 — Quality/release:** Android+iOS functional/regression tests, accessibility, performance, privacy/security review, monitoring, signing, store assets, store policy checks, internal testing/TestFlight, release, owner handover.

**Definition of done per feature:** matches reviewed Figma frame, navigation works, persists correct data, has validation/loading/error/empty states, handles edge cases, tests pass, no secrets exposed, reviewed with developer and committed. Screenshots alone do not count as done.

## 7. Codex execution rules (critical)

1. **First response:** Summarize repo/environment findings and provide a short actionable plan. Clearly distinguish verified, inferred and blocked work.
2. **Inspect before editing:** Check `pwd`, project structure, `pubspec.yaml`, git status, FVM files and current app entry point. Don't assume Nutrify exists.
3. **Do not touch `practice_flutter`** without explicit user permission. Preserve existing changes. Never run destructive commands (`rm -rf`, resets, broad upgrades) without explaining and getting approval.
4. **Ask before external spending/account actions**: paid AI APIs, Supabase provisioning, RevenueCat, Apple/Google developer accounts, publication, purchases, user-data uploads.
5. **Never invent credentials, backend contracts, medical/nutrition formulas, store pricing, or owner decisions.** Keep an `OPEN_QUESTIONS.md` and propose safe defaults clearly labeled as provisional.
6. **Implement in small reviewable vertical slices**, but keep the whole product roadmap visible. The user wants end-to-end ownership, not one giant untested code dump.
7. **Explain in Roman Urdu** what changed, why, how to run it, how to verify, and what remains. Show exact commands one step at a time for risky setup.
8. **Security:** RLS, least privilege, secure tokens, no hardcoded secrets, environment separation, validation, rate limiting, privacy-compliant logs, proper deletion flow.
9. **Tests:** Add and run unit/widget/integration tests as feasible; report actual commands/results and failures honestly. Don't claim iOS tested when only Android runs.
10. **Design fidelity:** Extract exact assets/colors/fonts/layouts from Figma when possible; avoid guessing values from tiny overview images.
11. **Deployment:** Android+iOS both required, but local iOS release is blocked by toolchain until addressed. Do not promise App Store acceptance.
12. **Project documents:** Maintain `README.md`, `ARCHITECTURE.md`, `FEATURE_MATRIX.md`, `OPEN_QUESTIONS.md`, `DECISIONS.md`, `TEST_PLAN.md`, `RELEASE_CHECKLIST.md` as work progresses.

## 8. Owner decisions to request early

- Existing backend/API and ownership? Access credentials? API documentation?
- Confirm supported platforms, launch countries, minimum OS versions and production bundle identifiers.
- Exact nutrition formulas and health disclaimer/clinical review requirements.
- AI provider, nutrition dataset source/licensing, per-scan budget and expected accuracy.
- Subscription tiers, free access, trial length, regional pricing, refund/restore policy.
- Google/Apple developer accounts, who owns them, release signing, privacy policy and support contact.
- Recipe community publishing/moderation and referral reward rules.
- Real supported languages, accessibility requirements and offline behavior.
- Final design assets, typography, icons, image rights, all Figma frames/prototypes and error states.
- Analytics/crash monitoring consent, retention, deletion and legal/privacy requirements.

## 9. Immediate instruction to Codex

**Start now with Phase 0 only.** Inspect the currently opened workspace and identify whether it is `practice_flutter` or a dedicated `nutrify` repository. Report findings; do not overwrite or move the existing practice app. If Nutrify exists, verify it builds on `emulator-5554` using its pinned compatible FVM SDK. If it does not exist, propose exact safe creation commands and ask before executing. Create a concise implementation roadmap and requirements/unknowns matrix grounded in this brief. Once the correct repository is confirmed, propose the first vertical slice: Figma-based splash screen with a reusable theme, asset handling and a test. **Do not attempt to build the entire product in one blind pass.**

---

**Source provenance:** This brief is compiled from the user's Figma overview screenshots, terminal logs, and project conversation. It is not an independently verified Figma export, owner-approved product requirements document, or completed technical design.

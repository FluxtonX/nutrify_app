# Feature matrix

Recorded 2026-11-17. Scope comes from the master brief; business rules and design
details require review. Both Android and iOS are confirmed targets. The static
Flutter Splash is implemented; other product features remain pending.
On 2026-11-17, Figma MCP successfully accessed the
user-owned copy `Lqb04pJffKql3AIaOS1ghC`: **57 mobile screen frames structurally
verified across Main Design, plus 3 empty Media Banners frames on a second page**.
Detailed properties were audited for Splash only; remaining property/asset audits
are blocked by the Starter-plan MCP call limit. See
[FIGMA_DESIGN_SPEC.md](FIGMA_DESIGN_SPEC.md) for all screen IDs, evidence levels
and missing information. Access to the original file was not reverified.

| Area | Current state | Dependencies / acceptance evidence |
| --- | --- | --- |
| Flutter scaffold and FVM | Present; repaired baseline verified | Flutter 3.24.4 is current development baseline only |
| Local Git and project documents | Established in Task 02; no commit or remote | Ignore checks, source preservation and baseline verification |
| Figma inventory and design tokens | 57 frame IDs/names/dimensions verified; Splash properties extracted | Starter MCP quota blocks remaining detailed audits; screenshots and exports pending |
| Splash, theme and routing | Static Flutter Splash and reusable theme implemented using original PNGs | Responsive contain layout; native system bars; animation and startup/routing remain pending |
| Onboarding and goals | Not implemented | Q04, Q12; validation, units, resume and approved calculations |
| Google/Apple authentication | Not implemented | Q01, Q07, Q08; sessions, retry, sign-out and deletion |
| Backend/storage/access controls | Not implemented; ownership unknown | Q01, Q08; contracts, migrations and isolation tests |
| Home and daily log | Not implemented | Q01, Q04, Q12; real totals and date boundaries |
| Food lookup/description/saved foods | Not implemented | Q01, Q05; portions, provenance and CRUD |
| Camera/AI scanning/correction | Not implemented | Q05, Q08; permissions, estimates, corrections and rate limits |
| Exercise | Not implemented | Q04; validation and transparent energy estimates |
| Weight history/analytics/streaks | Not implemented | Q04, Q12; approved formulas, trends and empty states |
| Personal/community recipes | Not implemented | Q09; portions, ownership and moderation |
| Profile/settings/localization | Not implemented | Q08, Q11; persistence, deletion and translated content |
| Subscriptions/entitlements | Not implemented | Q06, Q07; sandbox purchase, restore, renewal and revocation |
| Referrals | Not implemented | Q10; attribution, approved rewards and anti-abuse checks |
| Tests/accessibility | All 8 Splash tests pass; FVM analyze clean | Asset decoding, exact positions, four responsive sizes, semantics, static behavior and reference-image comparison; other feature/integration tests pending |
| Android delivery | Branded native launch and Flutter Splash build/install/cold-launch verified on Pixel_8_API_35 | Native and Flutter screenshots saved; older Android/night-mode runtime review, production IDs/signing and release testing pending |
| iOS delivery | Original-logo native launch storyboard configured; runtime verification pending | No installed simulator runtimes; iOS build/device tests pending |
| CI/CD, monitoring, deployment | Not configured | Q07, Q08, Q13; approved accounts and release process |

Definition of done: reviewed design, working navigation, correct persistent data
where applicable, validation/loading/error/empty states, edge-case tests, secret-safe
implementation and developer review. Mocks do not count as integrations. Task 02
creates no commit; committing requires a separate user instruction.

Design readiness: Splash `145:895` is 440 × 956. Logo `145:789` is 146 × 146 at
(147, 405), with a configured PNG export width of 512; loader `145:896` is
60 × 60 at (185, 785). Exact Splash paints and status-bar typography are recorded.
Original PNG exports are now available locally (logo 512 × 512; loader 180 × 180),
along with the 440 × 956 reference. Static implementation uses proportional
contain scaling and native system bars as explicit implementation decisions.
Loader animation and startup routing remain pending.
All requested feature areas have corresponding named frames; grouping is inferred
from names/context, and complete prototype flows are not verified. Splash has no
reactions in the inspected subtree. The 57-frame count includes variants/dialog
states and excludes reference screenshots, logo alternatives and UI fragments.

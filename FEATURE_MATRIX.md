# Feature matrix

Recorded 2026-11-17. Scope comes from the master brief; business rules and design
details require review. Both Android and iOS are confirmed targets. No Nutrify
product feature is implemented. Full Figma inventory is pending.

| Area | Current state | Dependencies / acceptance evidence |
| --- | --- | --- |
| Flutter scaffold and FVM | Present; repaired baseline verified | Flutter 3.24.4 is current development baseline only |
| Local Git and project documents | Established in Task 02; no commit or remote | Ignore checks, source preservation and baseline verification |
| Splash, theme and routing | Not implemented | Q02, Q12; reviewed assets, initialization/routing and tests |
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
| Tests/accessibility | Default counter widget test only | Feature tests, integration tests and device review pending |
| Android delivery | Debug build/install/launch passed during Phase 0 repair | Production IDs/signing and release testing pending |
| iOS delivery | Scaffold only; local runtime limitation | Supported build environment and iOS tests pending |
| CI/CD, monitoring, deployment | Not configured | Q07, Q08, Q13; approved accounts and release process |

Definition of done: reviewed design, working navigation, correct persistent data
where applicable, validation/loading/error/empty states, edge-case tests, secret-safe
implementation and developer review. Mocks do not count as integrations. Task 02
creates no commit; committing requires a separate user instruction.

# Decisions

Recorded 2026-11-17 from the master brief and explicit user instructions.
Confirmed decisions are distinct from proposals and observations.

| ID | Status | Decision / evidence | Consequence |
| --- | --- | --- | --- |
| D01 | Confirmed | Android and iOS are target platforms | Both need testing and deployment; desktop/web are not approved targets |
| D02 | Confirmed | Workspace is `/Users/mac/nutrify` | Preserve source; do not modify `practice_flutter` |
| D03 | Confirmed development baseline | FVM Flutter 3.24.4 / Dart 3.5.4; revision `603104015dd692ea3403755b55d07813d5cf8965` | Current compatible baseline, not final production SDK; upgrades require planned validation |
| D04 | Completed repair | Only SDK `text.dart` restored from D03 revision; modified file backed up outside SDK | Backup retained in ignored `sdk-repair-backups/`; analysis/test/Android launch passed |
| D05 | Approved Task 02 scope | Local Git, ignore review, README, questions, feature matrix and decisions | No commit, remote, push, package installation or UI implementation |
| D06 | Confirmed security boundary | Secrets/signing files and repair backups stay outside version control | Ignore patterns plus staging review; privileged keys never ship in mobile bundles |
| D07 | Pending owner decision | Backend existence/ownership unknown | No provider, schema, API contract or provisioning approved |
| D08 | Proposed only | Feature-first layout, Riverpod, GoRouter, Supabase, optional FastAPI and RevenueCat | Evaluate needs and compatibility before selection; install nothing in Task 02 |
| D09 | Observed limitation | Xcode 15.2 simulator runtime unavailable in Phase 0 audit | iOS unverified; production build-host/toolchain plan remains open |
| D10 | Pending design review | Full Figma frames/assets not inventoried | No pixel-perfect claim; screenshot prices/formulas/counts are not approved specifications |

Record future decisions with approval source, date and affected questions. Resolve
OPEN_QUESTIONS.md entries only when evidence or owner approval exists.

---
name: ios-simulator
description: Use when taking screenshots of, launching apps on, or UI-automating a running iOS Simulator (tap/type/swipe/inspect/record) via the ios-simulator MCP — covers where to save screenshot/video artifacts and avoiding scattered files in ~/Downloads or /tmp
---

# iOS Simulator

## Overview

The `ios-simulator` MCP drives an **already-booted** iOS Simulator: screenshots, app launch, UI automation (tap/type/swipe), accessibility inspection, and video. It does **not** build apps — building is out of scope (use the project's own build tooling first).

Prefer these MCP tools over raw `xcrun simctl` in Bash: they take an explicit `output_path` (no `/tmp` + `cp` dance) and integrate UI inspection with action in one toolset.

## Artifact policy (READ FIRST)

Screenshots and videos are **throwaway verification artifacts**, not deliverables. Without a rule, agents scatter them into `~/Downloads` (the MCP default) or `/tmp` root. Don't.

- **Always pass an explicit `output_path`** — never rely on the default (it lands in `~/Downloads`).
- Write every screenshot/video to a **`tmp/` directory at the project root**, using an absolute path: `<project-root>/tmp/<name>.png`.
- **`mkdir -p <project-root>/tmp`** once at the start if it doesn't exist.
- Ensure `tmp/` is git-ignored. If it isn't already, add `tmp/` to `.gitignore` — verification artifacts must never be committed.
- Use descriptive, ordered names (`home-01.png`, `after-tap-02.png`) so a sequence is readable.
- If the user asks for an artifact as a real deliverable, copy it out of `tmp/` to the requested path explicitly.

## Quick reference

| Tool | Purpose | Key args |
|---|---|---|
| `get_booted_sim_id` | Get UDID of the booted sim | — |
| `screenshot` | Save a screenshot | `output_path` (required), `type`, `display` |
| `ui_view` | Return screen image inline (no file) | — |
| `launch_app` | Launch app by bundle id | `bundle_id`, `terminate_running`, `env` |
| `install_app` | Install a built `.app`/`.ipa` | `app_path` |
| `open_simulator` | Open the Simulator.app window | — |
| `ui_describe_all` | Dump the whole accessibility tree | — |
| `ui_find_element` | Find element(s) by label/id | `search[]`, `type`, `matchMode` |
| `ui_describe_point` | What element is at (x,y) | `x`, `y` |
| `ui_tap` | Tap at coordinates | `x`, `y`, `duration` |
| `ui_type` | Type text (ASCII only, ≤500 chars) | `text` |
| `ui_swipe` | Swipe between two points | `x_start,y_start,x_end,y_end`, `duration` |
| `record_video` / `stop_recording` | Record a clip | `output_path`, `codec` |

`udid` is optional on every tool — it defaults to the single booted sim. Pass it explicitly only when more than one sim is booted.

## Core workflows

**Screenshot to verify state:**
```
mkdir -p <project-root>/tmp        # once
screenshot(output_path="<project-root>/tmp/state-01.png")
Read the PNG to actually look at it — a launch with no look proves nothing.
```
For a quick glance you don't need to keep, `ui_view` returns the image inline with no file written — prefer it when no artifact is needed.

**Launch / relaunch an app:**
```
launch_app(bundle_id="com.example.app", terminate_running=true)
```
`terminate_running=true` gives a clean relaunch. This is more stable than a hot-reload dev session that dies when its shell ends.

**UI automation loop (the reliable pattern):**
1. `ui_find_element(search=["Login"], type="Button")` → read the element's frame (x/y/size).
2. Tap the **center** of that frame with `ui_tap`. Don't guess coordinates from a screenshot's pixels.
3. `screenshot` to `tmp/` and Read it to confirm the result.
Repeat. Use `ui_describe_all` when you don't yet know what's on screen, `ui_describe_point` to identify what sits at a coordinate.

**Record a clip:** `record_video(output_path="<project-root>/tmp/flow.mp4")` … perform actions … `stop_recording()`.

## Common mistakes

| Mistake | Fix |
|---|---|
| Omitting `output_path` → file lands in `~/Downloads` | Always pass an absolute `tmp/` path |
| Dumping screenshots in `/tmp` root or project root | Use `<project-root>/tmp/` and git-ignore it |
| Tapping pixel coords read off a screenshot | Get the frame from `ui_find_element`/`ui_describe_point`, tap its center |
| `Bash: sleep 5` to wait for an animation | `sleep` is blocked; poll a condition or just re-screenshot |
| `ui_type` fails on emoji/non-ASCII | `ui_type` accepts ASCII (`\x20-\x7E`) only, ≤500 chars |
| Expecting the MCP to build the app | It can't; build first, then `install_app` + `launch_app` |
| Taking a screenshot but never Reading it | A blank/wrong frame is invisible until you look — always Read it |

<div align="center">

<image src="fastlane/metadata/android/en-US/images/icon.png" height="100"/>

# Chrono

### A modern and powerful clock, alarms, timer and stopwatch app for Android!

![tests](https://github.com/vicolo-dev/chrono/actions/workflows/tests.yml/badge.svg)
[![codecov](https://codecov.io/gh/vicolo-dev/chrono/branch/master/graph/badge.svg?token=cKxMm8KVev)](https://codecov.io/gh/vicolo-dev/chrono)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/7dc1e51c1616482baa5392bc0826c50a)](https://app.codacy.com/gh/vicolo-dev/chrono/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

[<img src="https://gitlab.com/IzzyOnDroid/repo/-/raw/master/assets/IzzyOnDroid.png" alt="Get it on IzzyOnDroid" height=80/>](https://apt.izzysoft.de/fdroid/index/apk/com.vicolo.chrono)
[<img src="https://i.ibb.co/q0mdc4Z/get-it-on-github.png" alt="Get it on Github" height=80/>](https://github.com/vicolo-dev/chrono/releases/latest)

</div>

Its usable, but still WIP, so you might encounter some bugs. So its not recommended to use to for critical alarms at the moment. Feel free to open an issue.

# Table of Content
- [Features](#features)
- [Platforms](#platforms)
- [Contribute](#contribute)
- [Development](#development)
- [Todo](#todo)
- [Screenshots](#screenshots)

## Features
- Modern and easy to use interface
### Alarms
- Customizable schedules (Daily, Weekly, Specific week days, Specific dates, Date range)
- Configure Melody, rising volume and vibrations
- Configure Snooze length and max snoozes
- Alarm tasks (Math problems, Retype text, Sequence, more to come)
- Filter alarms (all, today, tomorrow, snoozed, disabled, completed)
### Clock
- Customizable clock display
- World clocks with relative time difference
- Search and add cities
### Timer
- Configure Melody, rising volume and vibrations
- Timer presets
- Filter timers (all, running, paused, stopped)
### Stopwatch
- Lap history with lap times and elapsed times
- Lap comparisons
### Appearance
- Material You icons and themes
- Highly customizable color themes
- Highly customizable style themes

## Platforms
Currently, the app is only available for android. I don't have an apple device to develop for iOS, but feel free
to contribute if you want iOS support. The alarm and timer features
use android-only code, so that will need to be ported. Everything else should mostly work fine.

## Contribute

All contributions are welcome, whether creating issues, pull requests or translations. When contributing to this repository, please first discuss the change you wish to make via an issue. Also, please refer to [Effective Dart](https://dart.dev/effective-dart) as a guideline for the coding standards expected from pull requests.

## Development

This app is built using flutter. To start developing:
1. Follow [this](https://docs.flutter.dev/get-started/install) guide to install flutter and all required tools.
2. Run the app by `flutter run --flavor dev`. For production builds, use `flutter build apk --release --split-per-abi --flavor prod`.

## Todo
Stuff I would like to do soon™. In no particular order:
- Alarms
  - Alarm reliability testing system
  - Vibration patterns
  - Alternative time picker interfaces
  - Array alarms (alarm that will ring after set interval (10 minutes etc.)
  - More tasks
  - Custom ringtones
- Color schemes
  - More prebuilt themes  
  - Filter
  - Tags
  - Icon colors
- Theme
  - Icon themes
  - Font themes
  - System fonts
- Timer
  - Alternative duration picker interfaces
- Widgets
  - Clock
  - Clock faces
  - Alarms
  - Timers
  - Stopwatch
  - Customization
- Online?
  - Sync?
  - Community themes?
 
## Screenshots
<p float="left">
<image src="fastlane/metadata/android/en-US/images/phoneScreenshots/1.png" height="400"/>
<image src="fastlane/metadata/android/en-US/images/phoneScreenshots/2.png" height="400"/>
<image src="fastlane/metadata/android/en-US/images/phoneScreenshots/3.png" height="400"/>
<image src="fastlane/metadata/android/en-US/images/phoneScreenshots/6.png" height="400"/>
<image src="fastlane/metadata/android/en-US/images/phoneScreenshots/4.png" height="400"/>
<image src="fastlane/metadata/android/en-US/images/phoneScreenshots/5.png" height="400"/>
<image src="fastlane/metadata/android/en-US/images/phoneScreenshots/7.png" height="400"/>
<image src="fastlane/metadata/android/en-US/images/phoneScreenshots/8.png" height="400"/>
</p>



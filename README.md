# dawood-resume-mobile

Dawood Zafar's resume as a **native mobile app**, built with Flutter.

## Run it

1. Install Flutter (3.35 or newer): https://docs.flutter.dev/get-started/install
2. `flutter pub get`
3. `flutter run` (on a connected device or emulator)

## Build a release APK

```sh
flutter build apk --release
```

The APK lands in `build/app/outputs/flutter-apk/app-release.apk`.

## Update the content

All resume content lives in one file: [`lib/data/resume_data.dart`](lib/data/resume_data.dart).
Edit the lists there (experience, projects, extensions, skills, …) and hot-reload —
no other file needs to change.

## Project layout

```
lib/
  main.dart                 # app entry point
  theme.dart                # navy theme shared across screens
  data/resume_data.dart     # ALL resume content (edit me)
  widgets/section.dart      # section title + card wrappers
  screens/resume_screen.dart# the single scrollable resume screen
android/ ios/               # platform scaffolding (from `flutter create`)
```

## Notes

- Contact buttons (email, phone, GitHub, LinkedIn) and project links open via
  `url_launcher`.
- Experience is intentionally limited to **Dixeam** and **freelance** work only.

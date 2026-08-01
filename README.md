<div align="center">

# 🌿 NutriMind

**A mental-health-aware nutrition companion — scan your meals, track your macros, and take care of your mind.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Auth%20%7C%20Firestore-FFCA28?logo=firebase&logoColor=black)](https://firebase.google.com)
[![Groq](https://img.shields.io/badge/AI-Groq%20%2F%20Llama-F55036)](https://groq.com)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](#license)

Supports **Arabic 🇪🇬 & English 🇬🇧** · **Light ☀️ & Dark 🌙** themes

</div>

---

## 📱 Screenshots

<h3 align="center">🌙 Dark Mode — Arabic</h3>
<p align="center">
  <img src="screenshots/ar_dark_1.png" width="18%" />
  <img src="screenshots/ar_dark_2.png" width="18%" />
  <img src="screenshots/ar_dark_3.png" width="18%" />
  <img src="screenshots/ar_dark_4.png" width="18%" />
  <img src="screenshots/ar_dark_5.png" width="18%" />
</p>

<h3 align="center">☀️ Light Mode — English</h3>
<p align="center">
  <img src="https://github.com/user-attachments/assets/a92d77ff-3022-4361-9ef6-068984554a61" width="18%" />
    <img src="https://github.com/user-attachments/assets/41704046-b4d4-431d-a4e8-47806e40ede8" width="18%" />
  <img src="https://github.com/user-attachments/assets/e7320ecc-c4ca-44e3-ac25-50497e392b55" width="18%" />

  <img src="https://github.com/user-attachments/assets/fc273743-c3d3-484b-97b9-c25601064ae0" width="18%" />
  <img src="https://github.com/user-attachments/assets/d8e750c2-607b-4ce9-b45e-a94fd59e2d0d" width="18%" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/2eee8bbe-43ed-4c28-94e0-b6cb016ceb41" width="18%" />
    <img src="https://github.com/user-attachments/assets/2c035bb7-674a-4363-a6ea-802975f448a7" width="18%" />
  <img src="https://github.com/user-attachments/assets/0ed96328-f498-47a7-a88d-dfc03792c81a" width="18%" />

  <img src="https://github.com/user-attachments/assets/7c45d1ce-a4a7-4fdf-927a-c831dc290d72" width="18%" />
  <img src="https://github.com/user-attachments/assets/40a8aeb1-a53d-4a0f-bb3f-c82c089a695a" width="18%" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/56d0ae86-2bb6-44e1-b0e1-96ad5439c286" width="18%" />
    <img src="https://github.com/user-attachments/assets/980dcd42-dc0f-42e3-88bb-d7fb992bae1c" width="18%" />
  <img src="https://github.com/user-attachments/assets/e162309a-c1e2-43ef-9b83-e4c366a096e5" width="18%" />

  <img src="https://github.com/user-attachments/assets/5cb5bdb3-83fb-4539-9304-17574be45d0b" width="18%" />
  <img src="https://github.com/user-attachments/assets/4ccda379-1d9f-4904-a5ef-17c910bb5be0" width="18%" />
</p>



---

## ✨ About

**NutriMind** is a Flutter app that combines **nutrition tracking** with **mental wellbeing support**. Instead of manually logging every ingredient, users simply snap a photo of their meal — a Groq-hosted vision model analyzes it and instantly returns calories, protein, carbs, and fat. Alongside tracking, the app offers daily wellness tips and an in-app AI assistant that keeps users company and answers nutrition-related questions, all while staying strictly within the app's supportive, judgment-free scope.

## 🚀 Features

- 📸 **AI Meal Scanning** — take a photo (or pick from gallery) and get an instant nutritional breakdown powered by a **Groq vision model** (Llama 4 Scout)
- 🍳 **Three Daily Meals** — log breakfast, lunch, and dinner separately, each tagged and tracked on its own
- 📊 **Nutrition Dashboard** — animated calorie ring, macro breakdown, and a weekly trend chart (via `fl_chart`)
- 🗂️ **Meal History** — every scanned meal is saved to Firestore and tied to your account
- 💡 **Daily Tips** — bite-sized nutrition & mental-wellness tips, filterable by category
- 🤖 **AI Chat Assistant** — a **Groq (Llama 3.3)**-powered chatbot restricted to nutrition & wellbeing topics, with automatic **language mirroring** (replies in Arabic if you write Arabic, English if you write English)
- 🔐 **Firebase Authentication** — email/password sign up, login, email verification, and password reset
- ☁️ **Cloud Firestore** — all user data (profile & meals) synced securely per user
- 🌗 **Light & Dark Theme** — fully theme-aware UI across every screen
- 🌍 **Full Localization** — every string in the app (including error messages) is localized between Arabic and English — nothing is hardcoded
- 🎬 **Smooth Animations** — powered by `animate_do` throughout the app for a polished, premium feel

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart 3, sealed classes & pattern matching) |
| State Management | Bloc / Cubit |
| Dependency Injection | `get_it` |
| Backend | Firebase Auth, Cloud Firestore |
| AI — Meal Analysis | Groq API — vision model (Llama 4 Scout), OpenAI-compatible endpoint |
| AI — Chat Assistant | Groq API — text model (Llama 3.3 70B), same endpoint |
| Charts | `fl_chart` |
| Animations | `animate_do` |
| Responsive UI | `flutter_screenutil` |
| Image Capture | `image_picker` |
| Localization | Flutter's built-in `intl` / generated `S` class (`flutter gen-l10n`) |

## 🏗️ Architecture

The project follows a lightweight **feature-first, clean-architecture-inspired** structure — shared infrastructure lives in `core/`, and each feature owns its own `data` / `domain` / `presentation` layers.

```
lib/
├── core/
│   ├── common/
│   │   ├── models/          # Shared models (User, Meal, ChatMessage...)
│   │   ├── screens/          # Shared/reusable screens
│   │   └── widgets/           # Shared reusable UI (cards, chips, typing dots...)
│   ├── config/                 # Firestore collection names, Groq config
│   ├── di/                      # get_it service locator
│   ├── error/                    # Failure types + FailureCode-based localization
│   ├── helpers/                   # Logger, regex, snackbar, validators, bloc observer, enums, extensions, secure storage & shared prefs helpers
│   ├── routing/                    # App router & route names
│   ├── services/
│   │   ├── firebase/                # Thin wrappers around FirebaseAuth & Firestore
│   │   └── groq/                     # Chat assistant + meal vision analysis services
│   ├── theme/                         # Colors, text styles, theme data, theme manager (light/dark)
│   └── utils/                          # AppResult<T> (Success / Err), secure storage & shared pref keys
│
├── features/
│   ├── auth/                            # Login, register, password reset (Bloc/Cubit)
│   ├── chatbot/                          # AI assistant chat screen
│   ├── home/                              # Dashboard: calorie ring, macros, weekly chart
│   ├── nav_bar/                            # Bottom navigation
│   ├── onboarding/                          # First-run onboarding flow
│   ├── profile/                              # User profile & settings
│   ├── scan/                                  # Meal-type selection → capture → AI analysis → save
│   ├── splash/                                 # Splash screen
│   └── tips/                                    # Daily tips, filterable by category
│
├── generated/
│   └── l10n/                                     # Auto-generated localization (from .arb files)
│
├── firebase_options.dart
├── main.dart
└── my_app.dart
```

**Error handling philosophy:** every operation that can fail (Auth, Firestore, Groq) returns an `AppResult<T>` (`Success` / `Err`). Failures carry a `FailureCode` enum — not a hardcoded message — so the *same* failure can be correctly localized wherever it's displayed in the UI, regardless of the app's current language.

## ⚙️ Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x)
- A [Firebase](https://console.firebase.google.com) project with **Authentication** (Email/Password) and **Cloud Firestore** enabled
- A [Groq](https://console.groq.com) API key (used for both the meal-photo analysis and the chat assistant)

### Installation

```bash
# 1. Clone the repo
git clone https://github.com/<your-username>/nutrimind.git
cd nutrimind

# 2. Install dependencies
flutter pub get

# 3. Connect Firebase (creates firebase_options.dart)
flutterfire configure

# 4. Generate localization files
flutter gen-l10n

# 5. Run the app with your Groq API key
flutter run --dart-define=GROQ_API_KEY=your_groq_key_here
```

### Firestore Security Rules

Make sure each user can only access their own data:

```
match /users/{uid} {
  allow read, write: if request.auth != null && request.auth.uid == uid;

  match /meals/{mealId} {
    allow read, write: if request.auth != null && request.auth.uid == uid;
  }
}
```

### Permissions

**Android** (`android/app/src/main/AndroidManifest.xml`):
```xml
<uses-permission android:name="android.permission.CAMERA"/>
```

**iOS** (`ios/Runner/Info.plist`):
```xml
<key>NSCameraUsageDescription</key>
<string>We need camera access so you can photograph your meal.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>We need photo library access so you can choose a meal photo.</string>
```

> ⚠️ **Security note:** the API key passed via `--dart-define` is still bundled inside the compiled app. This is fine for development/MVP, but for a production release, consider proxying Groq requests through a Firebase Cloud Function so the key never ships inside the client.

## 🌍 Localization

All user-facing text — including error messages surfaced from Firebase/Groq failures — flows through the generated `S.of(context)` class, backed by `intl_ar.arb` and `intl_en.arb`. To add a new language, duplicate an `.arb` file, translate its values, register the locale, and run `flutter gen-l10n`.

## 🎨 Theming

The app ships with full **light/dark** support via a custom `ThemeExtension` (`customAppColors`), so every screen automatically adapts — no manual color branching required in the UI layer.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](../../issues).

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

## 👩‍💻 Author

**Romaissa Mohamed Fadel**
App Developer

---
<img width="1080" height="2340" alt="Screenshot_1785588061" src="https://github.com/user-attachments/assets/4ccda379-1d9f-4904-a5ef-17c910bb5be0" />
<img width="1080" height="2340" alt="Screenshot_1785588064" src="https://github.com/user-attachments/assets/8cd49141-44ff-4bc5-ab62-0b22da68f7fb" />
<img width="1080" height="2340" alt="Screenshot_1785588113" src="https://github.com/user-attachments/assets/ca708fa2-3309-4647-805e-0f903f221a5c" />



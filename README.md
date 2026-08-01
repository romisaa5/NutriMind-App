<div align="center">

# 🌿 NutriMind

**A mental-health-aware nutrition companion — scan your meals, track your macros, and take care of your mind.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Auth%20%7C%20Firestore-FFCA28?logo=firebase&logoColor=black)](https://firebase.google.com)
[![Groq](https://img.shields.io/badge/AI-Groq%20%2F%20Llama-F55036)](https://groq.com)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](#license)

Supports **Arabic 🇪🇬 & English 🇬🇧** · **Light ☀️ & Dark 🌙** themes

</div>

<br>

## 📑 Table of Contents

- [About](#-about)
- [Screenshots](#-screenshots)
- [Features](#-features)
- [Tech Stack](#️-tech-stack)
- [Architecture](#️-architecture)
- [Getting Started](#️-getting-started)
- [Localization](#-localization)
- [Theming](#-theming)


<br>

## ✨ About

**NutriMind** is a Flutter app that combines **nutrition tracking** with **mental wellbeing support**. Instead of manually logging every ingredient, users simply snap a photo of their meal a Groq-hosted vision model analyzes it and instantly returns calories, protein, carbs, and fat. Alongside tracking, the app offers daily wellness tips and an in-app AI assistant that keeps users company and answers nutrition-related questions, all while staying strictly within the app's supportive, judgment-free scope.

<br>

## 📱 Screenshots

<div align="center">

### 🌙 Dark Mode — Arabic

<table>
<tr>
<td><img src="https://github.com/user-attachments/assets/703347c8-8349-4a15-872a-6c10d8b325b9" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/f6345190-9900-4c1c-82da-572350492900" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/1f29b455-4076-4e83-be62-f9c40f62f535" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/df3b4647-3476-4fe2-a9ee-e47910606213" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/61f8907d-b159-480b-bbcc-5587b108d5e6" width="160" /></td>
</tr>
   <tr>

<td><img src="https://github.com/user-attachments/assets/e46693b5-5a32-4ae1-984b-06b9531d1a44" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/cc2036b9-174a-47a5-8ea7-139409e2f1a6" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/e15afbe1-72ef-4633-8ee0-192bed3be897" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/554712af-320b-4871-87f9-cfed5a5c81c9" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/fba9aa90-3be9-40c4-b019-0a2dee9c1424" width="160" /></td>
</tr>
</table>

### ☀️ Light Mode — English

<table>
<tr>
<td><img src="https://github.com/user-attachments/assets/a92d77ff-3022-4361-9ef6-068984554a61" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/41704046-b4d4-431d-a4e8-47806e40ede8" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/e7320ecc-c4ca-44e3-ac25-50497e392b55" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/fc273743-c3d3-484b-97b9-c25601064ae0" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/d8e750c2-607b-4ce9-b45e-a94fd59e2d0d" width="160" /></td>
</tr>
<tr>
<td><img src="https://github.com/user-attachments/assets/2eee8bbe-43ed-4c28-94e0-b6cb016ceb41" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/2c035bb7-674a-4363-a6ea-802975f448a7" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/0ed96328-f498-47a7-a88d-dfc03792c81a" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/7c45d1ce-a4a7-4fdf-927a-c831dc290d72" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/40a8aeb1-a53d-4a0f-bb3f-c82c089a695a" width="160" /></td>
</tr>
<tr>
<td><img src="https://github.com/user-attachments/assets/56d0ae86-2bb6-44e1-b0e1-96ad5439c286" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/980dcd42-dc0f-42e3-88bb-d7fb992bae1c" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/e162309a-c1e2-43ef-9b83-e4c366a096e5" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/5cb5bdb3-83fb-4539-9304-17574be45d0b" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/4ccda379-1d9f-4904-a5ef-17c910bb5be0" width="160" /></td>
</tr>
<tr>
<td><img src="https://github.com/user-attachments/assets/efa3c4e7-084b-422f-b1f3-579eb53f477d" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/39375e04-a63e-43f7-80b4-a2c696df4696" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/13686497-97ea-495d-856f-d47b9dab2d00" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/2e27729a-1cc1-4508-90b0-000b7ecd7b90" width="160" /></td>
<td><img src="https://github.com/user-attachments/assets/76395fd6-bed3-407a-b4bc-f1651d796b00" width="160" /></td>
</tr>
</table>

</div>

<br>

## 🚀 Features

| | |
|---|---|
|  **AI Meal Scanning** | Take a photo (or pick from gallery) and get an instant nutritional breakdown powered by a **Groq vision model** (Llama 4 Scout) |
|  **Three Daily Meals** | Log breakfast, lunch, and dinner separately, each tagged and tracked on its own |
|  **Nutrition Dashboard** | Animated calorie ring, macro breakdown, and a weekly trend chart (via `fl_chart`) |
|  **Meal History** | Every scanned meal is saved to Firestore and tied to your account |
|  **Daily Tips** | Bite-sized nutrition & mental-wellness tips, filterable by category |
|  **AI Chat Assistant** | A **Groq (Llama 3.3)**-powered chatbot restricted to nutrition & wellbeing topics, with automatic **language mirroring** (replies in Arabic if you write Arabic, English if you write English) |
|  **Firebase Authentication** | Email/password sign up, login, email verification, and password reset |
|  **Cloud Firestore** | All user data (profile & meals) synced securely per user |
|  **Light & Dark Theme** | Fully theme-aware UI across every screen |
|  **Full Localization** | Every string in the app — including error messages — is localized between Arabic and English; nothing is hardcoded |
|  **Smooth Animations** | Powered by `animate_do` throughout the app for a polished, premium feel |

<br>

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
| Env Variables | `flutter_dotenv` |
| Localization | Flutter's built-in `intl` / generated `S` class (`flutter gen-l10n`) |

<br>

## 🏗️ Architecture

The project follows a lightweight **feature-first, clean-architecture-inspired** structure — shared infrastructure lives in `core/`, and each feature owns its own `data` /  / `presentation` layers.




```
lib/
├── core/
│   ├── common/
│   │   ├── models/          # Shared models (User, Meal, ChatMessage...)
│   │   ├── screens/         # Shared/reusable screens
│   │   └── widgets/         # Shared reusable UI (cards, chips, typing dots...)
│   ├── config/               # Firestore collection names, Groq config
│   ├── di/                   # get_it service locator
│   ├── error/                # Failure types + FailureCode-based localization
│   ├── helpers/               # Logger, regex, snackbar, validators, bloc observer,
│   │                           # enums, extensions, secure storage & shared prefs helpers
│   ├── routing/                # App router & route names
│   ├── services/
│   │   ├── firebase/           # Thin wrappers around FirebaseAuth & Firestore
│   │   └── groq/                # Chat assistant + meal vision analysis services
│   ├── theme/                    # Colors, text styles, theme data, theme manager (light/dark)
│   └── utils/                     # AppResult<T> (Success / Err), secure storage & shared pref keys
│
├── features/
│   ├── auth/            # Login, register, password reset (Bloc/Cubit)
│   ├── chatbot/          # AI assistant chat screen
│   ├── home/              # Dashboard: calorie ring, macros, weekly chart
│   ├── nav_bar/             # Bottom navigation
│   ├── onboarding/           # First-run onboarding flow
│   ├── profile/                # User profile & settings
│   ├── scan/                     # Meal-type selection → capture → AI analysis → save
│   ├── splash/                     # Splash screen
│   └── tips/                         # Daily tips, filterable by category
│
├── generated/
│   └── l10n/            # Auto-generated localization (from .arb files)
│
├── firebase_options.dart
├── main.dart
└── my_app.dart
```



**Error handling philosophy:** every operation that can fail (Auth, Firestore, Groq) returns an `AppResult<T>` (`Success` / `Err`). Failures carry a `FailureCode` enum — not a hardcoded message — so the *same* failure can be correctly localized wherever it's displayed in the UI, regardless of the app's current language.

<br>

## ⚙️ Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x)
- A [Firebase](https://console.firebase.google.com) project with **Authentication** (Email/Password) and **Cloud Firestore** enabled
- A [Groq](https://console.groq.com) API key (used for both the meal-photo analysis and the chat assistant)

### Installation

```bash
# 1. Clone the repo
git clone https://github.com/romisaa5/NutriMind-App.git
cd NutriMind-App

# 2. Install dependencies
flutter pub get

# 3. Connect Firebase (creates firebase_options.dart)
flutterfire configure

# 4. Generate localization files
flutter gen-l10n
```

### Environment Variables

The Groq API key is loaded from a local `.env` file (via `flutter_dotenv`) instead of being hardcoded or committed to the repo.

1. Create a `.env` file in the project root:

   ```env
   GROQ_API_KEY=your_groq_key_here
   ```

2. Make sure it's registered as an asset in `pubspec.yaml`:

   ```yaml
   flutter:
     assets:
       - .env
   ```

3. Make sure `.env` is **git-ignored** (never commit real API keys):

   ```gitignore
   .env
   ```

4. Load it before `runApp()` in `main.dart`:

   ```dart
   await dotenv.load(fileName: ".env");
   ```

5. Then simply run the app normally:

   ```bash
   flutter run
   ```

> ⚠️ **Security note:** `flutter_dotenv` keeps the key out of source control, but the value still ends up bundled inside the compiled app binary at build time — same as any client-side key. For a production release, consider proxying Groq requests through a Firebase Cloud Function so the key never ships inside the client at all.

<br>

## 🌍 Localization

All user-facing text — including error messages surfaced from Firebase/Groq failures — flows through the generated `S.of(context)` class, backed by `intl_ar.arb` and `intl_en.arb`. To add a new language, duplicate an `.arb` file, translate its values, register the locale, and run `flutter gen-l10n`.

<br>

## 🎨 Theming

The app ships with full **light/dark** support via a custom `ThemeExtension` (`customAppColors`), so every screen automatically adapts — no manual color branching required in the UI layer.

<br>

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/romisaa5/NutriMind-App/issues).



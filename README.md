# Simple Flutter app for demonstrating Firebase Authentication using BloC pattern 

## Highlights

1. Firebase Login
2. Firebase Signup with email and password
3. Firebase Signup with Google Login
4. Data persistent after login/signup (Using SQLite) 
5. BloC pattern implementation
6. Multi language support (English and French)
   1. Note: It is [known issue](https://github.com/flutter/flutter/issues/14128) that multi language is not working in emulators.

## Setup instructions
1. Create new Firebase Project and register your app for Android and iOS from [Firebase Console](https://console.firebase.google.com).
2. Download `google-services.json` for Android and `GoogleService-Info.plist` and place them at `android/app/` and `ios/Runner/` directory respectively
3. Change URL schema with your URL as shown in below screenshot inside `ios\Runner\info.plist`
 <img src="/screenshots/plist_change.png" width="500" alt="Change in Info.plist"/> 
4. That's It!

## ToDos
1. Text/SMS based login implementation.
2. Firebase Analytics implementation
3. More language support

## Screenshots
<img src="/screenshots/login.png" width="346" height="615" alt="Login"/> 
<img src="/screenshots/signup.png" width="346" height="615" alt="Signup"/>
<img src="/screenshots/dashboard.png" width="346" height="615" alt="Dashboard"/>
<img src="/screenshots/login_fr.png" width="346" height="615" alt="Login - Fr"/>
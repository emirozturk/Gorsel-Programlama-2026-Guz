# MustafApp Flutter Client

A Flutter mobile application for MustafApp - a link management system.

## Features

- User authentication (login/register)
- View all saved links (caps)
- View link details with tags
- Add new links
- Delete links
- Pull-to-refresh functionality

## Setup

1. Install Flutter dependencies:
```bash
flutter pub get
```

2. Update the API base URL in `lib/services/api_service.dart`:
```dart
static const String baseUrl = 'http://your-backend-url:port/api';
```

For local development:
- iOS Simulator: `http://localhost:5000/api`
- Android Emulator: `http://10.0.2.2:5000/api`
- Physical device: `http://YOUR_COMPUTER_IP:5000/api`

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── user.dart
│   ├── link.dart
│   └── tag.dart
├── providers/                # State management
│   └── auth_provider.dart
├── screens/                  # UI screens
│   ├── login_screen.dart
│   ├── links_screen.dart
│   └── link_detail_screen.dart
└── services/                 # API services
    └── api_service.dart
```

## Backend API Endpoints

The app expects the following endpoints (you mentioned you'll implement them later):

- `POST /api/user/login` - User login
- `POST /api/user/register` - User registration
- `GET /api/link` - Get all links for authenticated user
- `GET /api/link/{id}` - Get specific link with tags
- `POST /api/link` - Create new link
- `DELETE /api/link/{id}` - Delete link

## Notes

- The app uses JWT token authentication
- Tokens are stored in SharedPreferences
- Make sure your backend has CORS enabled for mobile app development

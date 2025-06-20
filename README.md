# Nawel - Food Delivery App

Nawel is a modern food delivery application built with Flutter, offering a seamless experience for ordering food from local restaurants.

## 🚀 Features

### Authentication
- Email and password authentication
- Secure user data storage using Hive
- Persistent login state
- User profile management

### Home Screen
- Custom app bar with user greeting
- Services section
- Promotional offers
- Popular restaurants list
- Quick shortcuts
- Location-based delivery options

### Onboarding
- Interactive onboarding screens
- Smooth animations
- First-time user experience

## 🏗️ Architecture

The project follows Clean Architecture principles with the following structure:

```
lib/
├── core/
│   ├── errors/
│   ├── helper_function/
│   ├── services/
│   │   ├── firebase_auth_service.dart
│   │   ├── hive_service.dart
│   │   └── get_it_service.dart
│   ├── utils/
│   └── widgets/
├── Features/
│   ├── Auth/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   └── repos/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   └── repos/
│   │   └── presentation/
│   │       ├── blocs/
│   │       └── views/
│   ├── home/
│   │   └── presentation/
│   │       └── views/
│   ├── on_boarding/
│   │   ├── data/
│   │   └── presentation/
│   └── splash/
│       └── presentation/
└── main.dart
```

### Architecture Components

1. **Core Layer**
   - Contains shared utilities, services, and widgets
   - Handles dependency injection using GetIt
   - Manages local storage with Hive
   - Implements Firebase authentication

2. **Features Layer**
   - Each feature is organized in its own directory
   - Follows Clean Architecture with data, domain, and presentation layers
   - Uses BLoC pattern for state management

3. **Data Layer**
   - Implements repository interfaces
   - Handles data models and data sources
   - Manages API calls and local storage

4. **Domain Layer**
   - Contains business logic
   - Defines entities and repository interfaces
   - Independent of data sources

5. **Presentation Layer**
   - Implements UI components
   - Uses BLoC for state management
   - Handles user interactions

## 🛠️ Technologies Used

- **Flutter**: UI framework
- **Firebase**: Authentication and backend services
- **Hive**: Local storage
- **GetIt**: Dependency injection
- **BLoC**: State management
- **ScreenUtil**: Responsive UI
- **Google Fonts**: Typography
- **Animate Do**: Animations

## 🔧 Setup and Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/nawel.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Add your Firebase configuration files
   - Enable Email/Password authentication in Firebase Console

4. Run the app:
```bash
flutter run
```

## 📱 Screenshots

![App Screenshot](https://github.com/user-attachments/assets/ae363c42-f440-49be-8637-b1e142c2b851)

## 🎥 Demo

Check out the demo video: [Watch Demo](https://github.com/user-attachments/assets/f1dc153f-8d8e-45a1-a1c5-afaa3bcacb7b)


## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Mahmoud Elnagar** - *Initial work* - [GitHub]([https://github.com/Mahmoudelnagar5)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- All contributors who have helped in the development


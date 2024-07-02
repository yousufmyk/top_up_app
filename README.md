# Top Up App

This is a Flutter application that allows users to manage top-up beneficiaries, explore top-up options, and execute top-up transactions for UAE phone numbers. The app supports user authentication and verification, and it includes features to manage user balance and top-up limits.

## Features

- Manage beneficiaries
- Top-up transactions
- User balance and verification status
- Customizable user properties

## Customization

If you need to change the user balance or verification status, you can do so in the beneficiaryListView.dart file.

- Open lib/widgets/beneficiaryListView.dart.
- Locate the BeneficiaryListView class.
- Update the user properties as needed:

```bash
final user = User(balance: 3000, isVerified: false);
```
## Getting Started

### Prerequisites

- Flutter SDK
- Dart
- A code editor (e.g., VS Code, Android Studio)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yousufmyk/top_up_app.git
   cd top_up
2. Install dependencies:
    ```bash
    flutter pub get

3. Run the app:
    ```bash
    flutter run

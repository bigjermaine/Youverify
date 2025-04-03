# SwiftUI Product Fetch App

This project is a simple SwiftUI application that fetches product data from an API, stores it using **Core Data**, and utilizes **UserDefaults** for user preferences. The architecture follows the **MVVM** pattern for clean separation of concerns.

## Features
- Fetch product data from an API
- Store fetched data in **Core Data** for offline access
- Use **UserDefaults** for storing user preferences
- Follow **MVVM** architecture

## Prerequisites
Ensure you have the following installed:
- macOS with **Xcode** (latest version recommended)
- Swift 5+
- Internet connection (for API fetching)

## Setup Instructions

### 1. Clone the Repository
```sh
$ git clone  https://github.com/bigjermaine/Youverify.git
I
```

### 2. Open the Project
- Open `Youverify.xcodeproj` in Xcode.

### 3. Run the Application
- Select a simulator or your device in Xcode.
- Press **Cmd + R** or click **Run** to build and launch the app.

## Project Structure (MVVM)

## Core Data Integration
- The `PersistenceController` class initializes Core Data.
- Products are stored in Core Data for offline access.
- Data is fetched using `NSFetchRequest` in `DessertCoredataViewmodell`.

## Using UserDefaults
- User preferences (e.g., sorting order) are stored in `UserDefaults`.
```swift



## Contributing
Feel free to fork this repository and submit pull requests!

## License
This project is licensed under the **MIT License**.


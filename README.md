
---

# Webtoon Explorer

Webtoon Explorer is a Flutter-based mobile application that allows users to explore a wide range of webtoons, view detailed information, and manage their favorites. The app includes features for rating webtoons and storing favorite items locally using Hive for persistent storage. 

## Features

- **Explore Webtoons**: Browse through a variety of webtoon categories with detailed descriptions, genres, and creator information.
- **Detail View**: Tap on any webtoon to view its description, creator, and current rating.
- **Favorites**: Add or remove webtoons from your favorites list and access them easily through the favorite tab.
- **Rating System**: Rate webtoons and see your ratings saved across sessions.
- **Persistent Storage**: Webtoons and favorite lists are stored locally using Hive, ensuring offline access and persistent data storage.
- **Smooth Navigation**: The app features a Google Nav Bar for seamless navigation between screens.

## Screenshots

![image](https://github.com/user-attachments/assets/70f1073f-f1fe-479c-9e21-8d97e36d951f)

![image](https://github.com/user-attachments/assets/f13d104c-1d35-4bed-b180-a99a783cd193)

![image](https://github.com/user-attachments/assets/9044e1d8-ed07-44eb-9809-1ef431650051)


## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/mayankyadav06/webtoon_explore.git
    ```
2. Navigate into the project directory:
    ```bash
    cd webtoon-explorer
    ```
3. Install dependencies:
    ```bash
    flutter pub get
    ```
4. Run the app on an emulator or physical device:
    ```bash
    flutter run
    ```

## Dependencies

- `provider`: State management
- `hive`: Local storage
- `google_nav_bar`: For bottom navigation
- `rating_bar`: For the webtoon rating system

## Usage

- **Home Screen**: Displays all available webtoons in card format. Click on a webtoon to view more details.
- **Favorites Screen**: Manage your favorite webtoons and access them directly from this screen.
- **Rating**: Each webtoon can be rated via the detail screen, and the ratings will be updated and stored locally.

## Project Structure

- `lib/models`: Contains the `Webtoon` model class.
- `lib/providers`: Manages the application state such as current screen and webtoon data using `provider`.
- `lib/screens`: Contains the main screens like `HomeScreen`, `DetailScreen`, and `FavoriteScreen`.
- `lib/widgets`: Contains reusable widgets like `WebtoonItem` and `MyBottomNavBar`.
- `lib/services`: Handles data storage with Hive.
  
## Contribution

Feel free to contribute by submitting a pull request or raising an issue for any bug fixes or feature improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

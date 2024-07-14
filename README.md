# STAGE OTT assignment

A project created in flutter using Bloc supports mobile platforms i.e. IOS and Andorid.

* The project is an assignmet to the STAGE OTT <https://www.stage.in/>.

## Getting Started

The project in developed a clean architecture framework, leveraging Firebase Firestore for data storage to show stories like social meadia application i.e. Instagram.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/a15056478/stage-stories.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

Go to project main.dart or run this command. Make sure you are connected to a simulator or a physical device.

```
flutter run 
```


## App Features

* Home (Chat Page)
* Story Page


### Libraries & Tools Used

* [Bloc](https://pub.dev/packages/flutter_bloc)
* [Firestore](https://firebase.flutter.dev/) Database
* [Get It](https://pub.dev/packages/get_it) (Dependenc Injection)
* [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) (For responsiveness)
* [outline_gradient_button](https://pub.dev/packages/outline_gradient_button) (To provient gradient effect to story)
* [story_view](https://pub.dev/packages/story_view) (Handle stories)
* [flutter_carousel_slider](https://pub.dev/packages/flutter_carousel_slider)(Give cubic effect on slide change on story)

### Folder Structure

Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- common/
|- core/
|- core/model/
|- core/params/
|- core/repository/
|- core/use case
|- domain
|- presentation
|- presentation/bloc
|- presentation/view
|- presentation/widget
|- main.dart
|- firebase_options.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```

1 - Common 
    a. Hexcolor - custom colors
    b. ThemeText - custom textstyles
    c. ImagePath - path to assets



2 - Core
    a. Respository - Contains Onboarding and Chat repository 
    b. Use Cases - use cases for the application
    c. Params - parameters required to pass in use case
    d. Model -  Data models to use response data from API and Map to the object

3 - Domain
    a. Dependency Injenction(di)
    b. Firebase - Firebase fuctions for db operations

4 - Model - Contains data models required in the app for story

5 - Presentation
    a. Blocs - Contain blocs for managing stories
    b. view -  Contains all screesn for the app

6- Widget - Conatins common widgets for the app

```

### UI

-> Home Page - Main screen where user can see all stories


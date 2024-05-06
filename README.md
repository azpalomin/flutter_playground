# flutter_playground

A basic Flutter app to showcase some of my skills and test things. It has an app for testing and showcasing aswell as a place to have a shared package of reusable components.

# Prerequisites
- Install flutter

## Web
- Install chrome

## Android
- Install Android Studio

## IOS
- You need a mac
- Install Xcode

# How to run 
- `cd ./flutter_playground_app`
- `flutter run`

## Web
- Connect a device or start a simulator
- `flutter run -d chrome`

## Android
- Connect a device or start a simulator
- `flutter devices`
- `flutter run -d <device-name>`

## IOS
- Connect a device or start a simulator
- `flutter devices`
- `flutter run -d <device-name>`

# Developing

## Folder Structure
- flutter_playground_app
  - This is where the testing goes ong
- flutter_shared
  - Shared components are added here

## Getting started
- At the root directory run
  - `flutter pub get`
- Then melos can be used to update the multiple packages or it can be done manually
  - `dart pub global activate melos`
  - `melos run pub_get`
- Using without melos
  - `cd ./flutter_shared`
    - `flutter pub get`
  - `cd ./flutter_playground_app`
    - `flutter pub get`

## Turn on Husky for precommits
`dart run husky install`

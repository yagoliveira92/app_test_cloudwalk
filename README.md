<p align="center">
  <a href="https://gist.github.com/cloudwalk-tests/4689b2c15fd7d9d8d8fa807772d54516">
    <h1 align="center">App Test CloudWalk - Mobile Engineer Test #1</h1>
  </a>
   <br>


## Summary

- [Summary](#summary)
- [Started](#started)
- [Packages and Dependencies](#packages-and-dependencies)

## Started
This project follows Clean Architecture with TDD exemplified by [Resocoder](https://resocoder.com/flutter-clean-architecture-tdd/), as well as [Cubit](https://bloclibrary.dev/) for management of state.

To be able to properly execute the project, you must follow some steps:
1. Download all packages and dependencies:
    - `flutter pub get`
2. Generate and insert `.env` in the root of project. The name of the keys can be found in file `.env-config`;
3. Enjoy!

## Packages and Dependencies

All packages and dependencies are in `pubspec.yaml`, but we have listed the main ones below with links so you can consult them:

* [cubit](https://pub.dev/packages/bloc) For state management,
* [flutter_bloc](https://pub.dev/packages/flutter_bloc) Integrate Cubit for Flutter Widget,
* [sembast](https://pub.dev/packages/sembast) NoSQL database to storage offline data,
* [get_it](https://pub.dev/packages/get_it) Tool for dependency injection,
* [cached_network_image](https://pub.dev/packages/cached_network_image) Cache Image to return when not have internet, 

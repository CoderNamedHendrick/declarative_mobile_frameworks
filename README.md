# Declarative Mobile Frameworks

This project serves as a demonstration and a guide to using declarative mobile frameworks such as Jetpack Compose,
SwiftUI and Flutter. In this project we will be using Flutter to navigate to Swift UI and Jetpack Compose views while
sending data from said native views to flutter.

## Approaches 🛠️

- ### Flutter app to native platforms via method channels [Part 1]

This approach uses method channels to communicate between the flutter app and the native platforms. This is the
most common approach to communicate between flutter and native platforms. This approach is used to send data from
the flutter app to the native platforms and vice versa. You can find the article which serves as a
guide [here](https://medium.com/@sebastinesoacatp/integrating-jetpack-compose-and-swiftui-into-flutter-apps-via-method-channels-f2e10d0bd4e5)
and the accompanying
project [here](https://github.com/CoderNamedHendrick/declarative_mobile_frameworks/tree/article-project).

- ### Flutter app to native platforms via pigeon [Part 2]

This approach uses pigeon to communicate between the flutter app and the native platforms. This is a less common
approach but leads to writing better flutter to native integrations. You can find the comprehensive
guide [here](https://medium.com/@sebastinesoacatp/practical-guide-to-flutter-native-integration-with-pigeon-b6c575dd033f)
and the accompanying
project [here](https://github.com/CoderNamedHendrick/declarative_mobile_frameworks/tree/article-project-pigeon).
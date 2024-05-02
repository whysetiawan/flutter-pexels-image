# Jala Technical Assessment

This is Technical Assessment for Jala. The project architecture for this project using **Clean Architecture** following several articles below.

- [A different approach to frontend architecture](https://dev.to/itswillt/a-different-approach-to-frontend-architecture-38d4)
- [Comparison of Domain-Driven Design and Clean Architecture Concepts](https://khalilstemmler.com/articles/software-design-architecture/domain-driven-design-vs-clean-architecture/)
- [Understanding Domain Entities [with Examples] - DDD w/ TypeScript](https://dev.to/itswillt/a-different-approach-to-frontend-architecture-38d4)
- [An Introduction to Flutter Clean Architecture](https://medium.com/ruangguru/an-introduction-to-flutter-clean-architecture-ae00154001b0)

## Why Clean Architecture?

Clean Architecture is a design pattern that helps to create software architectures that are easier to understand and maintain. By separating the business logic from the presentation layer and the data layer, the architecture is make each layer has its own responsibility. Creating a software that performs fast is easy, but creating a software that performs well is hard. Performs well means it's reliable and easy to maintain. But since clean architecture about separations of concern, _dependency drilling_ might be a problem. In order to solve the issue, i use `get_it` as **Service Locator**.

## Why Bloc?

Bloc is one of the most popular state management around Flutter Developers. It may not as simple as **GetX** which provide almost everything into your app. Bloc is very flexible in most of cases. Since Clean Architecture goals is separating layer, so each layer should be decouple from each other. I also like to use Bloc as pure state management without including any widgets in there.

## Atomic Design

Most of the Clean Architecture declaring the **pages** in the presentation layer. I decide where **composite or atomic** widget in the presentation layer and move **pages** outside of modules. The purpose of this approach is reusability, some **composite or atomic** component might be used in multiple **pages**. Then it's easier if other modules can use these **composite or atomic** component.

## Styling

I'm aware if the figma provide some design tokens like typography and color. I implement some of them in the app. So i can confidently say if the UI/UX team has standards for building software. I use `flutter_screenutil` for responsive design, so almost in every mobile devices it can be used.

## Release

- APK LINK

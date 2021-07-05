

<img  width="1000" alt="swift_standards" src="stack-kit-logo.png" >

StackKit brings the power of [ResultBuilders](https://github.com/apple/swift-evolution/blob/main/proposals/0289-result-builders.md) to UIStackView’s, allowing you to easily build declarative UI while only using [UIKit](https://developer.apple.com/documentation/uikit). StackKit is a great solution for anyone looking to level up their programmatic UI without having to convert an existing project to SwiftUI. Its API design is closely matched to SwiftUI making it effortless to pick up without having to accommodate any reactive programming patterns. 

Feel free to try out the examples in the project and browse the code samples below. Hopefully you can see how powerful and simplistic StackKit Kit is and we hope to see it in your project in the near future.

StackKit is built and maintained with love by the Gymshark Engineering Team 💙📱

|                      Vertical                      |                      Horizontal                      |                      Mixed                      |                      Feed                      |
| :------------------------------------------------: | :--------------------------------------------------: | :---------------------------------------------: | :--------------------------------------------: |
| ![](https://i.ibb.co/SfRFXhq/vertical-example.png) | ![](https://i.ibb.co/3C0FD39/horizontal-example.png) | ![](https://i.ibb.co/PxGHZc5/mixed-example.png) | ![](https://i.ibb.co/Ct7PTSX/feed-example.png) |



## Note ⚠️

If you are trying to use StackKit to handle large data sets to replace a UITableView or UICollection view you will run into performance issues. For this usecase you should use [SharklListKit](https://github.com/gymshark/ios-shark-list-kit ) 🦈🗒

## Installation

**Swift Package Manager (SPM)**

To install StackKit using [Swift Package Manager](https://github.com/apple/swift-package-manager) you can follow the [tutorial published by Apple](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) using the URL for the StackKit repo with the current version:

\1. In Xcode, select “File” → “Swift Packages” → “Add Package Dependency”

\2. Enter git@github.com:gymshark/shark-stack-kit.git

## Why would you use StackKit instead of SwiftUI

- You still want to use UIKit throughout your app
- Harness the power of building UI like SwiftUI does but your team/project isn’t ready for reactive programming.
- It’s easier to integrate into existing code bases. With SwiftUI you can’t swap a **View** for a **UIView**. This makes it hard to integrate old UI components into SwiftUI.
- SwiftUI hides the underlying view rendering therefore making it hard to see what is actually going on and refine issues. With StackKit you are still within UIKit so don't loose any abilities.
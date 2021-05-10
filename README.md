## <img src="https://i.ibb.co/TBpKFYB/Screenshot-2021-05-10-at-02-07-24.png" style="zoom:30%;" />

SharkStackKit is a libary that extends UIStackView and combines the power of ResultBuilders to give you the power to easily build declarative UI's with [UIKit](https://developer.apple.com/documentation/uikit). If If you like the style of building SwiftUI layouts but your project is using UIKit then SharkStackKit is a great intermediate substituion without having any breaking changes. 

I have made a couple of examples below to show how powerful SharkStackKit can be with minimal code.

SharkStackKit is built and maintained with love by the Gymshark Engineering Team 💙📱

|                      Vertical                      |                      Horizontal                      |                      Mixed                      |                      Feed                      |
| :------------------------------------------------: | :--------------------------------------------------: | :---------------------------------------------: | :--------------------------------------------: |
| ![](https://i.ibb.co/SfRFXhq/vertical-example.png) | ![](https://i.ibb.co/3C0FD39/horizontal-example.png) | ![](https://i.ibb.co/PxGHZc5/mixed-example.png) | ![](https://i.ibb.co/Ct7PTSX/feed-example.png) |



## Note ⚠️

If you are trying to use SharkStackKit to handle large data sets to replace a UITableView or UICollection view you will run into performance issues. For this usecase you should use [SharklListKit](https://github.com/gymshark/ios-shark-list-kit ) 🦈🗒

## Installation

**Swift Package Manager (SPM)**

To install SharkStackKit using [Swift Package Manager](https://github.com/apple/swift-package-manager) you can follow the [tutorial published by Apple](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) using the URL for the SharkListKit repo with the current version:

\1. In Xcode, select “File” → “Swift Packages” → “Add Package Dependency”

\2. Enter git@github.com:gymshark/shark-stack-kit.git



## Why would you use SharkStackKit instead of SwiftUI

- You still want to use UIKit throughout your app
- Want the power of build UI like SwiftUI but team isn’t ready to move a fully reactive approach
- It’s easier to integrate into existing code bases. With SwiftUI you can’t swap a **View** for a **UIView**. This makes it hard to integrate old UI components into SwiftUI.
- SwiftUI hides the underlying view rendering therefore making it hard to see what is actually going on, with SharkStackKit you can easily reach down to UIKit

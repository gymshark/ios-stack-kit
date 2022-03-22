#
# Be sure to run `pod lib lint StackKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StackKit'
  s.version          = '0.1.0'
  s.summary          = 'The power of SwiftUI with UIKit'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
StackKit harnesses the power of UIStackView's and Swift's ResultBuilders together. This allows you to easily build declarative UI while only using UIKit. StackKit is a great solution for anyone looking to level up their programmatic UI without having to convert an existing project to SwiftUI. Its API design is closely matched to SwiftUI making it effortless to pick up without having to accommodate any reactive programming patterns.
                       DESC

  s.homepage         = 'https://github.com/gymshark/StackKit'
  s.screenshots      = 'https://github.com/gymshark/ios-stack-kit/raw/master/Assets/example-1.png', 'https://github.com/gymshark/ios-stack-kit/raw/master/Assets/example-2.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gymshark' => 'engineering@gymshark.com' }
  s.source           = { :git => 'https://github.com/gymshark/ios-stack-kit', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Sources/StackKit/**/*'
  
  # s.resource_bundles = {
  #   'StackKit' => ['StackKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'ConstraintKit'
end

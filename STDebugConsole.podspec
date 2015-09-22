#
# Be sure to run `pod lib lint STDebugConsole.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "STDebugConsole"
s.version          = "0.1.0"
s.summary          = "Debug Console in your application."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
s.description      = <<-Console insert your application, you can see console log in your Application

s.homepage         = "https://github.com/startry/STDebugConsole"
# s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = 'MIT'
s.author           = { "chenxing.cx" => "chenxingfl@gmail.com" }
s.source           = { :git => "https://github.com/startry/STDebugConsole.git", :tag => '0.1.0' }
s.social_media_url = 'https://twitter.com/xStartry'

s.platform     = :ios, '7.0'
s.requires_arc = true

s.source_files = 'Pod/Classes/**/*'
s.resource_bundles = {
'STDebugConsole' => ['Pod/Assets/*.png']
}

s.public_header_files = 'Pod/Classes/**/*.h'
s.frameworks = 'UIKit', 'Foundation'

end

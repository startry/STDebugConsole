Pod::Spec.new do |s|
s.name             = "STDebugConsole"
s.version          = "0.1.1"
s.summary          = "Debug Console in your application."

s.description      = <<-DESC
                     Redirect NSLog to file system, and print all log in App. Tester can see all log info in application.
                     DESC

s.homepage         = "https://github.com/startry/STDebugConsole"
s.license          = 'MIT'
s.author           = { "chenxing.cx" => "chenxingfl@gmail.com" }
s.source           = { :git => "https://github.com/startry/STDebugConsole.git", :tag => '0.1.1' }
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

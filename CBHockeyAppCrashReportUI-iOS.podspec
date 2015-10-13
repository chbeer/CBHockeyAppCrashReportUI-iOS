Pod::Spec.new do |s|

  s.name         = "CBHockeyAppCrashReportUI-iOS"
  s.version      = "0.0.3"
  s.summary      = "Dialog for adding details to a crash report as in the Mac version of HockeyApp."

  s.description  = <<-DESC
                   Dialog for adding details to a crash report as in the Mac version of HockeyApp.
                   Uses a grouped UITableView for the dialog UI.
                   DESC

  s.license            = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "Christian Beer" => "christian.beer@chbeer.de" }
  s.social_media_url   = "http://twitter.com/Christian_Beer"
  s.homepage           = "https://github.com/chbeer/CBHockeyAppCrashReportUI-iOS"

  s.platform     = :ios, "6.1"

  s.source       = { :git => "https://github.com/chbeer/CBHockeyAppCrashReportUI-iOS.git", :tag => s.version }

  s.source_files  = "Library", "Library/*.{h,m}"
  s.resources = "Library/Resources/**"

  s.requires_arc = true

#  s.dependency "HockeySDK"
  s.pod_target_xcconfig = {
    'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/HockeySDK/HockeySDK-iOS/HockeySDK.embeddedframework"',
    'OTHER_LDFLAGS' => '-framework "HockeySDK"',
  }

  s.frameworks = [ "UIKit", "CoreGraphics", "QuartzCore", "AssetsLibrary", "MobileCoreServices", "QuickLook", "CoreText" ]
  s.libraries = "c++"

end

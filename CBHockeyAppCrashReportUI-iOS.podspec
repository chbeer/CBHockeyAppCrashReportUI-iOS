Pod::Spec.new do |s|

  s.name         = "CBHockeyAppCrashReportUI-iOS"
  s.version      = "0.0.1"
  s.summary      = "Dialog for adding details to a crash report as in the Mac version of HockeyApp."

  s.description  = <<-DESC
                   Uses a UITableView for the dialog.
                   DESC

  s.license      = "MIT"

  s.author             = { "Christian Beer" => "christian.beer@chbeer.de" }
  s.social_media_url   = "http://twitter.com/Christian_Beer"

  s.platform     = :ios, "6.1"

  s.source       = { :git => "https://github.com/chbeer/CBHockeyAppCrashReportUI-iOS.git", :tag => "0.0.1" }

  s.source_files  = "Library", "Library/*.{h,m}"
  s.resources = "Library/Resources/*.png"

  s.requires_arc = true

  s.dependency "HockeySDK"

end

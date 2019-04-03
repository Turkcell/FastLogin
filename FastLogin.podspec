Pod::Spec.new do |s|

  s.authors      = "Turkcell",
  s.name         = "FastLogin"
  s.summary      = "Fast Login"
  s.version      = "1.11.2"
  s.homepage     = "https://www.turkcell.com.tr"
  s.license      = { :type => 'Apache 2.0', :file => 'LICENSE' }

  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/Turkcell/FastLogin.git", :tag => s.version.to_s}

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #

  s.source_files        = "Framework/DigitalGate.framework/Headers/*.h"
  s.public_header_files = "Framework/DigitalGate.framework/Headers/*.h"
  s.vendored_frameworks = "Framework/DigitalGate.framework"
  s.frameworks          = "UIKit", 'Foundation'


end

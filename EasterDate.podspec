Pod::Spec.new do |s|
  s.name             = 'EasterDate'
  s.version          = '0.6.3'
  s.summary          = 'Easter date calculation for NSDate'

  s.description      = <<-DESC
This CocoaPod extends `NSDate` with class methods to calculate the dates of Western and Eastern Orthodox Easter.
                       DESC

  s.homepage         = 'https://github.com/threebytesfull/EasterDate'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rufus Cable' => 'rufus@threebytesfull.com' }
  s.source           = { :git => 'https://github.com/threebytesfull/EasterDate.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/threebytesfull'

  s.ios.deployment_target = '8.0'

  s.osx.deployment_target = '10.10'

  s.tvos.deployment_target = '9.0'

  s.source_files = 'Sources/**/*'
  s.frameworks = 'Foundation'
end

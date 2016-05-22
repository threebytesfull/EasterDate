Pod::Spec.new do |s|
  s.name             = 'EasterDate'
  s.version          = '0.1.0'
  s.summary          = 'Easter date calculation for NSDate'

  s.description      = <<-DESC
This CocoaPod extends `NSDate` with class methods to calculate the dates of
Western and Eastern Orthodox Easter.
                       DESC

  s.homepage         = 'https://github.com/threebytesfull/EasterDate'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rufus Cable' => 'rufus@threebytesfull.com' }
  s.source           = { :git => 'https://github.com/threebytesfull/EasterDate.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/threebytesfull'
  s.ios.deployment_target = '8.0'
  s.source_files = 'EasterDate/Classes/**/*'
  s.frameworks = 'Foundation'
end

require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name           = 'braze-react-native-sdk'
  s.version        = package['version']
  s.summary        = package['description']
  s.description    = package['description']
  s.license        = package['license']
  s.author         = package['author']
  s.homepage       = package['homepage']
  s.source         = { :git => 'git+https://github.com/braze-inc/braze-react-native-sdk.git', :tag => s.version }

  s.requires_arc   = true
  s.platform       = :ios, '11.0'

  s.preserve_paths = 'LICENSE.md', 'README.md', 'package.json', 'index.js'
  s.source_files   = 'iOS/**/*.{h,m}'

  s.dependency 'BrazeKit', '~> 5.9.1'
  s.dependency 'BrazeLocation', '~> 5.9.1'
  s.dependency 'BrazeUI', '~> 5.9.1'

  s.dependency 'React-Core'

  # For compatibility with Objective-C++
  s.user_target_xcconfig = { 'OTHER_CPLUSPLUSFLAGS' => '-fmodules -fcxx-modules' }
end
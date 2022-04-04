#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint camera_scan.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'camera_scan'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin for make camera snapshots.'
  s.description      = 'A Flutter plugin for make camera snapshots.'
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'WeScan', '>= 0.9'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
    s.ios.deployment_target = '10.0'
end
# require 'json'

# package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

# Pod::Spec.new do |s|
#   s.name         = "react-native-ble-plx-swift"
#   s.version      = package['version']
#   s.summary      = "React Native Bluetooth Low Energy library - Swift static library"

#   s.authors      = { "Przemysław Lenart" => "przemek.lenart@gmail.com" }
#   s.homepage     = "https://github.com/selvera/react-native-ble-plx#readme"
#   s.license      = "Apache License 2.0"
#   s.platform     = :ios, "8.0"

#   s.source       = { :git => "https://github.com/selvera/react-native-ble-plx.git" }
#   s.source_files  = "ios/**/*.{swift}"
#   s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.1' }

#   # s.dependency 'QNSDK'
#   # s.subspec "QNSDK" do |spec|
#   #   # spec.source_files   = "MyThing/Core/**/*.{h,m,swift}"
#   #   # spec.public_header_files = "QNSDK/Core/*.{h}"
#   #   # spec.header_dir = "Core"
#   #   spec.source_files = 'QNSDK/SDK/**/*'
#   #   spec.vendored_libraries = 'QNSDK/SDK/libQNDeviceSDK.a'
#   #   spec.public_header_files= 'QNSDK/SDK/**/*.h'
#   # end

#   # s.dependency 'QNSDK'
#   # s.vendored_libraries = 'QNSDK/SDK/libQNDeviceSDK.a'
#   # s.public_header_files= 'QNSDK/SDK/**/*.h'
#   # s.static_framework = true
#   # s.frameworks = 'QNSDK'
# end

require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "react-native-ble-plx-swift"
  s.version      = package['version']
  s.summary      = "React Native Bluetooth Low Energy library - Swift static library"

  s.authors      = { "Przemysław Lenart" => "przemek.lenart@gmail.com" }
  s.homepage     = "https://github.com/selvera/react-native-ble-plx#readme"
  s.license      = "Apache License 2.0"
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/selvera/react-native-ble-plx.git" }
  s.source_files  = "ios/**/*.{swift, qn}", "ios/*.{qn}"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.1' }
  

#  s.dependency 'QNSDK'
   s.subspec "QNSDK" do |spec|
     # spec.source_files   = "MyThing/Core/**/*.{h,m,swift}"
     # spec.public_header_files = "QNSDK/Core/*.{h}"
      spec.header_dir = "ios/QNSDK"
     spec.source_files = 'ios/QNSDK/SDK/**/*'
#     spec.vendored_libraries = 'ios/QNSDK/SDK/libQNDeviceSDK.a'
     spec.public_header_files= 'ios/QNSDK/SDK/**/*.h'
     spec.dependency 'QNSDK'
   end

   s.dependency 'QNSDK'
  # s.vendored_libraries = 'QNSDK/SDK/libQNDeviceSDK.a'
  # s.public_header_files= 'QNSDK/SDK/**/*.h'
  # s.static_framework = true
  # s.frameworks = 'QNSDK'
end

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
end

def shared_pods
  pod 'Swinject'
  pod 'SnapKit', '~> 5.6.0'
  pod 'Alamofire'
  pod 'SDWebImage', '~> 5.0'
end

target 'SNASA' do
  shared_pods
end

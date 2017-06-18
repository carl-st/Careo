# Uncomment this line to define a global platform for your project
platform :ios, '9.0'

target 'Careo' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Careo
  pod 'Realm', :git => 'https://github.com/realm/realm-cocoa.git', :branch => 'master', submodules: true
  pod 'RealmSwift', :git => 'https://github.com/realm/realm-cocoa.git', :branch => 'master', submodules: true
  pod 'Alamofire', '~> 4.0'
  pod 'AlamofireImage', '~> 3.1'
  pod 'AlamofireNetworkActivityIndicator', '~> 2.0'
  pod 'AlamofireObjectMapper', '~> 4.0'
  pod 'TPKeyboardAvoiding', '~> 1.3'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxRealm'
  pod 'RxAlamofire'
  pod 'RxRealmDataSources'
  pod 'SIAlertView'
  pod 'NVActivityIndicatorView'

  target 'CareoTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'OHHTTPStubs'
    pod 'OHHTTPStubs/Swift'
    pod 'RxSwift'
    pod 'RxRealm'
    pod 'AlamofireObjectMapper', '~> 4.0'
  end

  target 'CareoUITests' do
    inherit! :search_paths
    # Pods for testing
  end


  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
      end
    end
  end
end

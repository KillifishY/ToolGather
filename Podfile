# Uncomment the next line to define a global platform for your project

#platform :ios, '12.0'
# For CocoaPods 1.8.0 或以上版本，使用cdn来避免clone master，加快pod update的速度。
source 'https://gitee.com/mirrors/CocoaPods-Specs.git'
#source 'https://cdn.cocoapods.org/'
#source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'

target 'ToolGather' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

	pod 'Kingfisher'
	pod 'Alamofire'
	pod 'SnapKit', '~> 5.0.0'
	pod 'SwiftyJSON'
  pod 'HandyJSON'
  pod 'Moya'
  #pod 'BayMaxProtector'
  
  #pod 'dsBridge'
  
  # WebRTC
  #pod 'CocoaAsyncSocket'
  #pod 'GoogleWebRTC'
  
#  pod 'GoogleWebRTC'
  #pod "ESPullToRefresh"

  # crash 规避
  pod 'AvoidCrash', '2.5.2'
  # Persistence
  #pod 'WCDB.swift', '1.0.8.2'
  pod 'SwiftyUserDefaults', '4.0.0'
  
  # Rx
  #pod 'NSObject+Rx', '4.4.1'
  #pod 'RxCocoa', '~> 4.4.2'
  #pod 'RxDataSources', '~> 3.1.0'
  #pod 'Moya/RxSwift', '~> 12.0.1'
  
  #layout
  pod 'DeviceKit'
  pod 'NVActivityIndicatorView'
  pod 'FSPagerView'
  pod 'SideMenu'
  pod 'TOCropViewController'
  pod 'NotificationBannerSwift', '~> 3.0.0'
  pod 'AnimatedCollectionViewLayout'
  pod "ESTabBarController-swift"
  pod 'FoldingCell'
  pod 'amrnb'
#  pod 'HXPhotoPicker', '~> 4.0.0'
end

post_install do|installer|
  #最小版本支持11.0
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end

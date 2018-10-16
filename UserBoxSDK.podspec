


Pod::Spec.new do |s|
  s.name             = 'UserBoxSDK'
  s.version          = '0.1.1'
  s.summary          = 'This is UserBoxSDK!'
 
  s.description      = <<-DESC
This is UserBoxSDK which is provided for UserBox's clients.
                       DESC
 
  s.homepage         = 'https://github.com/furkanbekil/UserBoxSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '<Furkan Bekil>' => '<furkan@bekil.net>' }
  s.source           = { :git => 'https://github.com/furkanbekil/UserBoxSDK.git', :tag => s.version.to_s }
  s.swift_version = '4.2'
 
  s.ios.deployment_target = '9.0'
  s.source_files = "UserBoxSDK/*.swift"
 
end
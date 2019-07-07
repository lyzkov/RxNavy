Pod::Spec.new do |s|
  s.name             = 'RxNavy'
  s.version          = '0.1.0'
  s.summary          = 'Reactive navigation through segues'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/lyzkov/RxNavy'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Piotr Łyczba' => 'lyzkov@gmail.com' }
  s.source           = { :git => 'https://github.com/lyzkov/RxNavy.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.3'

  s.swift_versions = ['4.0', '4.1', '4.2', '5.0']

  s.source_files = 'Sources/**/*'
  
  s.dependency 'RxSwift', '~> 5.0'
  s.dependency 'RxCocoa', '~> 5.0'
end

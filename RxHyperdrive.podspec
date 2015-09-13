Pod::Spec.new do |spec|
  spec.name = 'RxHyperdrive'
  spec.version = '0.1.0'
  spec.summary = 'RxSwift extensions for Hyperdrive, the generic Swift Web API client'
  spec.homepage = 'https://github.com/kylef/RxHyperdrive'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author = { 'Kyle Fuller' => 'kyle@fuller.li' }
  spec.social_media_url = 'http://twitter.com/kylefuller'
  spec.source = { :git => 'https://github.com/kylef/RxHyperdrive.git', :tag => spec.version }
  spec.source_files = 'RxHyperdrive/*.{h,swift}'
  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'
  spec.watchos.deployment_target = '2.0'
  spec.requires_arc = true
  spec.dependency 'Hyperdrive', '~> 0.2.0'
  spec.dependency 'RxSwift', '2.0.0-alpha.3'
end


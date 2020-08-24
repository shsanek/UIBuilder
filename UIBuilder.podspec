Pod::Spec.new do |spec|

  spec.name         = 'UIBuilder'
  spec.source_files           = 'Sources/**/*.swift'

  spec.ios.deployment_target = '12.0'

  spec.version = '1.0.0'
  spec.authors = 'Alexandr Shipin'
  spec.license = 'Empty License'
  spec.homepage = 'https://github.com/shsanek/UIBuilder'
  spec.source = { :git => 'https://github.com/shsanek/UIBuilder' }
  spec.summary = 'UIBuilder'

end

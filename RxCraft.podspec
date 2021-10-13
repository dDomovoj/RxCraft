Pod::Spec.new do |s|
    s.name = 'RxCraft'
    s.version = '0.0.1'
    s.summary = 'Lightweight Reactive lib'
    s.swift_version = '5.4'
  
    s.homepage = 'https://github.com/dDomovoj/RxCraft'
    s.license = { :type => "MIT" }
    s.author = { 
      'Dzmitry Duleba' => 'dmitryduleba@gmail.com'
    }
    s.source = { :git => 'https://github.com/dDomovoj/RxCraft.git', :tag => s.version.to_s }
    s.framework = ["Foundation"]
  
    s.ios.deployment_target = '11.0'
    s.source_files = 'Sources/RxCraft/*.swift'
  
  end
  

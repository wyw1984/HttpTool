Pod::Spec.new do |s|
    s.name         = 'HttpTool'
    s.version      = '2.0.0'
    s.summary      = 'An easy way to use AFN'
    s.homepage     = "https://github.com/wyw1984/HttpTool"
    s.license      = 'MIT'
    s.authors      = {"qq2126724184" => "2126724184@qq.com" } 
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/wyw1984/HttpTool.git', :tag => s.version}
    s.source_files = 'HttpTool/**/*.{h,m}'
    s.requires_arc = true
    s.dependency 'AFNetworking'
end

#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'nokogiri'

module Router
  VERSION = '0.1.1'
end

desc "Updates all source and test file headers"
task :headers do
  header = <<EOS
//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

EOS
  Dir[ '{src,test}/**/*.as' ].each do |uri|
    src = IO.read( uri )
    File.open( uri, 'w+' ) do |f|
      f << src.sub( /.+?(?=package)/m, header )
    end
  end
end

desc "Builds documentation"
task :docs do
  `asdoc \
   -output build/docs \
   -source-path src \
   -doc-sources src \
   -compiler.debug=true \
   -warnings=true \
   -main-title 'Router API Documentation' \
   -window-title 'Router API Documentation'`
end

desc "Generates source manifest XML"
task :manifest do
  Dir.chdir( 'src' ){
    File.open( 'router-manifest.xml', 'w+' ) do |f|
      doc = Nokogiri::XML::Builder.new do |xml|
        xml.componentPackage {
          Dir.glob( '**/*.as' ).each do |uri|
            xml.component( :class => uri.gsub( '/', '.' ).sub( /\.as$/, '' ) )
          end
        }
      end
      f << doc.to_xml
    end
  }
end

desc "Builds SWC"
task :swc => :manifest do
  `compc \
   -source-path src \
   -include-sources src \
   -namespace http://jeremyruppel/mxml src/router-manifest.xml \
   -output build/bin/router-#{Router::VERSION}.swc`
end

desc "Compiles and runs the test suite"
task :test do
  `mxmlc \
  -source-path+=test,src,libs/src \
  -library-path+=libs/bin \
  -output deploy/Router.swf \
  -static-link-runtime-shared-libraries=false \
  test/RouterTestRunner.mxml`
  File.delete 'deploy/Router.swf.cache'
  `open deploy/index.html`
end

desc "Builds SWC, docs, manifest, and tests"
task :release => [ :headers, :docs, :swc, :test ]
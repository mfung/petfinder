$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'petfinder'
require 'spec'
require 'spec/autorun'
require 'fakeweb'

Spec::Runner.configure do |config|  
end

def fixture_file(filename)
  File.read(File.dirname(__FILE__) + "/fixtures/#{filename}")
end

def stub_get(url, filename, options={})
  opts = {:body => fixture_file(filename)}.merge(options)
  
  FakeWeb.register_uri(:get, url, opts)
end
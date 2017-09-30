require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

WebMock.disable_net_connect!(allow_localhost: true)

VCR.configure do |c|
  #the directory where your cassettes will be saved
  c.cassette_library_dir = 'test/vcr'
  # your HTTP request service.
  c.hook_into :webmock
end



class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end

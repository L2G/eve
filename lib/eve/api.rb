require 'eve/api/request'
require 'eve/api/response'
require 'eve/api/services'
require 'eve/api/connectivity'

module Eve
  class API
    include Eve::API::Connectivity
    include Eve::API::Services
    attr_reader :options

    def initialize(options = {})
      @options = default_options.merge(options)
    end

    private
    def default_options
      {
        :base_uri => "http://api.eve-online.com",
      }
    end
  end
end

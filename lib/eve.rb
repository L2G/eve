$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'eve/dependencies'
require 'eve/errors'
require 'eve/api'

module Eve
  VERSION = '0.0.1'

  class << self
    def cache_store
      @cache_store ||= [:file_store, "tmp/eve.cache"]
    end

    def cache_store=(a)
      @cache_store = [a].flatten
      @cache = ActiveSupport::Cache.lookup_store(a) if @cache
    end

    def cache
      @cache ||= defined?(Rails) ? Rails.cache : ActiveSupport::Cache.lookup_store(*cache_store)
    end
  end
end

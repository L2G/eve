module Eve
  class API
    module Services
      module Account
        def characters
          validate_credentials(:character)
          request(:account, :characters)
        end
      end
    end
  end
end

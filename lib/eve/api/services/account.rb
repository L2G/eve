module Eve
  class API
    module Services
      module Account
        def account_status
          validate_credentials(:character)
          request(:account, :account_status)
        end

        def api_key_info
          validate_credentials(:character)
          request(:account, :api_key_info)
        end

        def characters
          validate_credentials(:character)
          request(:account, :characters)
        end
      end
    end
  end
end

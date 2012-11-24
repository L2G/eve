require 'spec_helper'

describe Eve::API::Services::Corporation do
  context "#account_balance" do
    context "with a valid corporation API key" do
      subject { mock_service('corporation', 'account_balance',
                  $corporation_api_key.merge(:character_id => $character_id)) }

      it "should load account balances" do
        subject.accounts.should behave_like_rowset('accountID,accountKey,balance')
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('corporation', 'account_balance') }.should raise_error(ArgumentError)
      end
    end
  end
end

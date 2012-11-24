require 'spec_helper'

describe Eve::API::Services::Corporation do
  context "#wallet_transactions" do
    context "with a valid corporation API key" do
      subject { mock_service('corporation', 'wallet_transactions',
                  $corporation_api_key.merge(:character_id => $character_id)) }

      it "should load a list of wallet transactions" do
        subject.transactions.should behave_like_rowset('transactionDateTime,transactionID,quantity,typeName,typeID,
            price,clientID,clientName,characterID,characterName,stationID,stationName,transactionType,transactionFor')
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('corporation', 'wallet_transactions') }.should raise_error(ArgumentError)
      end
    end
  end
end

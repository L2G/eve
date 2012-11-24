require 'spec_helper'

describe Eve::API::Services::Corporation do
  context "#market_orders" do
    context "with a valid corporation API key" do
      subject { mock_service('corporation', 'market_orders',
                  $corporation_api_key.merge(:character_id => $character_id)) }

      it "should load a list of market orders" do
        subject.orders.should behave_like_rowset('orderID,charID,stationID,volEntered,volRemaining,minVolume,
                                                 orderState,typeID,range,accountKey,duration,escrow,price,bid,issued')
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('corporation', 'market_orders') }.should raise_error(ArgumentError)
      end
    end
  end
end

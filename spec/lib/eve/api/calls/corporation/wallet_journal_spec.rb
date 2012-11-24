require 'spec_helper'

describe Eve::API::Services::Corporation do
  context "#wallet_journal" do
    context "with a valid corporation API key" do
      subject { mock_service('corporation', 'wallet_journal',
                  $corporation_api_key.merge(:character_id => $character_id)) }

      it "should load a list of journal entries" do
        subject.entries.should behave_like_rowset('date,refID,refTypeID,ownerName1,ownerID1,ownerName2,ownerID2,
            argName1,argID1,amount,balance,reason')
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('corporation', 'wallet_journal') }.should raise_error(ArgumentError)
      end
    end
  end
end

require 'spec_helper'

describe Eve::API::Services::Corporation do
  context "#member_tracking" do
    context "with a valid corporation API key" do
      subject { mock_service('corporation', 'member_tracking',
                  $corporation_api_key.merge(:character_id => $character_id)) }

      it "should load a list of members" do
        subject.members.should behave_like_rowset('characterID,name,startDateTime,baseID,base,title,logonDateTime,
              logoffDateTime,locationID,location,shipTypeID,shipType,roles,grantableRoles')
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('corporation', 'member_tracking') }.should raise_error(ArgumentError)
      end
    end
  end
end

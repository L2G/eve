require 'spec_helper'

describe Eve::API::Services::Corporation do
  context "#member_tracking" do
    context "with a valid api key" do
      subject { mock_service('corporation', 'member_tracking', :user_id => $user_id,
                                                     :character_id => $character_id,
                                                     :api_key => $full_api_key) }

      it "should load a list of members" do
        subject.members.should behave_like_rowset('characterID,name,startDateTime,baseID,base,title,logonDateTime,
              logoffDateTime,locationID,location,shipTypeID,shipType,roles,grantableRoles')
      end
    end

    context "without an api key" do
      it "should raise an ArgumentError" do
        proc { mock_service('corporation', 'member_tracking') }.should raise_error(ArgumentError)
      end
    end
  end
end

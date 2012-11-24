require 'spec_helper'

describe Eve::API::Services::Corporation do
  context "#member_security" do
    context "with a valid corporation API key" do
      subject { mock_service('corporation', 'member_security',
                  $corporation_api_key.merge(:character_id => $character_id)) }

      it "should load lists of roles and titles for specified user" do
        %w(roles grantable_roles roles_at_hq grantable_roles_at_hq roles_at_base grantable_roles_at_base
           roles_at_other grantable_roles_at_other).each do |row|
          subject.member.send(row).should behave_like_rowset('roleID,roleName')
        end
        subject.member.titles.should behave_like_rowset('titleID,titleName')
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('corporation', 'member_security') }.should raise_error(ArgumentError)
      end
    end
  end
end

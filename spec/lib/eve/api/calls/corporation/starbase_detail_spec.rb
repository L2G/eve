require 'spec_helper'

describe Eve::API::Services::Corporation do
  context "#starbase_detail" do
    context "with a valid corporation API key" do
      subject { mock_service('corporation', 'starbase_detail',
                  $corporation_api_key.merge(:character_id => $character_id,
                                             :args => ['1234567890'])) }

      it "should load starbase details" do
        subject.state.should == 4
        subject.general_settings.usage_flags.should == 3
        subject.general_settings.deploy_flags.should == 0
        subject.general_settings.allow_corporation_members.should == 1
        subject.general_settings.allow_alliance_members.should == 1
        subject.combat_settings.on_standing_drop.standing.should == 10
        subject.combat_settings.on_status_drop.enabled.should == 0
        subject.combat_settings.on_status_drop.standing.should == 0
        subject.combat_settings.on_aggression.enabled.should == 0
        subject.combat_settings.on_corporation_war.enabled.should == 1
        subject.fuel.should behave_like_rowset('typeID,quantity')
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('corporation', 'starbase_detail') }.should raise_error(ArgumentError)
      end
    end
  end
end

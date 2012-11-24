require 'spec_helper'

describe Eve::API::Services::Corporation do
  context "#fac_war_stats" do
    context "with a valid character API key" do
      subject { mock_service('corporation', 'fac_war_stats',
                  $character_api_key.merge(:character_id => $character_id)) }

      it "should load factional warfare stats" do
        subject.faction_id.should == 500001
        subject.faction_name.should == "Caldari State"
        subject.pilots.should == 6
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('corporation', 'fac_war_stats') }.should raise_error(ArgumentError)
      end
    end
  end
end

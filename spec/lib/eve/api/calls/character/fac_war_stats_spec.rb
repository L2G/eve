require 'spec_helper'

describe Eve::API::Services::Character do
  context "#fac_war_stats" do
    context "with a valid character API key" do
      subject { mock_service('character', 'fac_war_stats',
                  $character_api_key.merge(:character_id => $character_id)) }

      it "should produce faction warfare stats for character" do
        subject.faction_id.should == 500001
        subject.faction_name.should == 'Caldari State'
        subject.enlisted.should == DateTime.parse('2008-06-10 22:10:00')
        subject.current_rank.should == 4
        subject.highest_rank.should == 4
        subject.kills_yesterday.should == 0
        subject.kills_last_week.should == 0
        subject.kills_total.should == 0
        subject.victory_points_yesterday.should == 0
        subject.victory_points_last_week.should == 1044
        subject.victory_points_total.should == 0
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('character', 'fac_war_stats') }.should raise_error(ArgumentError)
      end
    end
  end
end

require 'spec_helper'

describe Eve::API::Services::Character do
  context "#upcoming_calendar_events" do
    context "with a valid character API key" do
      subject { mock_service('character', 'upcoming_calendar_events',
                  $character_api_key.merge(:character_id => $character_id)) }

      it "should return calendar events for a given character" do
        subject.upcoming_events.should behave_like_rowset(
          "eventID,ownerID,ownerName,eventDate,eventTitle,duration," +
          "importance,response,eventText"
        )
      end
    end

    context "with a valid character API key but no character_id" do
      it "should raise an ArgumentError" do
      proc { mock_service('character', 'upcoming_calendar_events',
               $character_api_key) }.should raise_error(ArgumentError)
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('character', 'upcoming_calendar_events') }.should raise_error(ArgumentError)
      end
    end
  end
end

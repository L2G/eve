require 'spec_helper'

describe Eve::API::Services::Character do
  context "#skill_queue" do
    context "with a valid character API key" do
      subject { mock_service('character', 'skill_queue',
                  $character_api_key.merge(:character_id => $character_id)) }

      it "should return the character's training queue" do
        subject.skillqueue.should behave_like_rowset('queuePosition,typeID,level,startSP,endSP,startTime,endTime')
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('character', 'skill_queue') }.should raise_error(ArgumentError)
      end
    end
  end
end

require 'spec_helper'

describe Eve::API::Services::Corporation do
  context "#medals" do
    context "with a valid corporation API key" do
      subject { mock_service('corporation', 'medals',
                  $corporation_api_key.merge(:character_id => $character_id)) }

      it "should load a list of corporation medals" do
        subject.medals.should behave_like_rowset('medalID,title,description,creatorID,created')
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('corporation', 'medals') }.should raise_error(ArgumentError)
      end
    end
  end
end

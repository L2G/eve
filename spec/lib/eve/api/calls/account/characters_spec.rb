require 'spec_helper'

describe Eve::API::Services::Account do
  context "#characters" do
    context "with a valid character API key" do
      subject { mock_service(:account, :characters, $character_api_key) }

      it "should list account characters" do
        subject.characters.should behave_like_rowset('name,characterID,corporationName,corporationID') { |row|
          %w(Mary Marcus Dieinafire).should include(row.name)
          %w(150267069 150302299 150340823).should include(row.character_id.to_s)
        }
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service(:account, :characters) }.should raise_error(ArgumentError)
      end
    end
  end
end

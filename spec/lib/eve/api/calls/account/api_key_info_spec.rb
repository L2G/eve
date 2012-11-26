require 'spec_helper'

describe Eve::API::Services::Account do
  context "#api_key_info" do
    context "with a valid character API key" do
      subject { mock_service(:account, :api_key_info, $character_api_key).key }

      it "should return key's access mask" do
        subject.access_mask.should   == 268435455
        subject[:access_mask].should == 268435455
      end

      it "should return key's type" do
        subject.type.should   == 'Account'
        subject[:type].should == 'Account'
      end

      it "should return key's expiration date" do
        subject.expires.should   == Time.utc(2013,10,29)
        subject[:expires].should == Time.utc(2013,10,29)
      end

      it "should return characters to which key has access" do
        character_ids = [92555468, 1332417978, 1964985550]
        character_names = ["N-H'mal-Oi Ataru", "Arunui", "klahauss"]
        corporation_ids = [98086823, 1000170, 1000165]
        corporation_names = [
          "The Grigorians", "Republic Military School", "Hedion University"
        ]

        subject.characters.should behave_like_rowset(
         'characterID,characterName,corporationID,corporationName'
         ) {|character|
            character_ids.should include(character.character_id)
            character_names.should include(character.character_name)
            corporation_ids.should include(character.corporation_id)
            corporation_names.should include(character.corporation_name)
        }
      end
    end

    context "with a valid corporation API key" do
      subject { mock_service(:account, :api_key_info, $corporation_api_key) }

      it "should do something", :pending => "Need corporation API key for " +
                                            "testing"
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service(:account, :api_key_info) }.should raise_error(ArgumentError)
      end
    end
  end
end

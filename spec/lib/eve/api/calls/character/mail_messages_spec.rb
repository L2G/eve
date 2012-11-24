require 'spec_helper'

describe Eve::API::Services::Character do
  context "#mail_messages" do
    context "with a valid corporation API key" do
      subject { mock_service('character', 'mail_messages',
                  $corporation_api_key.merge(:character_id => $character_id)) }

      it "should provide a list of mail messages" do
        subject.mail_messages.should behave_like_rowset('messageID,senderID,sentDate,title,toCorpOrAllianceID,toCharacterIDs,toListIDs,read')
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('character', 'mail_messages') }.should raise_error(ArgumentError)
      end
    end
  end
end

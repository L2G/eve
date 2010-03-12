require 'spec_helper'

describe Eve::API::Services::Corporation do
  context "#member_medals" do
    context "with a valid api key" do
      subject { mock_service('corporation', 'member_medals', :user_id => $user_id,
                                                     :character_id => $character_id,
                                                     :api_key => $limited_api_key) }

      it "should load a list of issued medals" do
        subject.issued_medals.should behave_like_rowset('medalID,characterID,reason,status,issuerID,issued')
      end
    end

    context "without an api key" do
      it "should raise an ArgumentError" do
        proc { mock_service('corporation', 'member_medals') }.should raise_error(ArgumentError)
      end
    end
  end
end

require 'spec_helper'

describe Eve::API::Services::Account do
  context "#account_status" do
    context "with a valid character API key" do
      subject { mock_service(:account, :account_status, $character_api_key) }

      it "should return account status information" do
        subject.create_date.should eq(Time.utc(2008,4,10, 3,27))
        subject.logon_count.should == 133
        subject.logon_minutes.should == 9297
        subject.paid_until.should eq(Time.utc(2012,12,23, 3,13,42))
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service(:account, :account_status) }.should raise_error(ArgumentError)
      end
    end
  end
end

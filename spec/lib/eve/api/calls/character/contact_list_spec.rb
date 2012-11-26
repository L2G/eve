require 'spec_helper'

describe Eve::API::Services::Character do
  context "#contact_list" do
    context "with a valid character API key" do
      subject { mock_service('character', 'contact_list',
                  $character_api_key.merge(:character_id => $character_id)) }

      it "should return a list of basic contacts" do
        subject.contact_list.should behave_like_rowset(
         'contactID,contactName,inWatchlist,standing'
         ) {|c|
          case c.contact_id
            when 92482485
              c.contact_name.should == 'Sari Charnoski'
              c.standing.should == -10
              c.in_watchlist.should be_false

            when 92526196
              c.contact_name.should == 'Ellsworth Lobach'
              c.standing.should == 5
              c.in_watchlist.should be_true

            when 92555279
              c.contact_name.should == 'Arnetta Leverone'
              c.standing.should == 0
              c.in_watchlist.should be_true
          end
        }
      end

      it "should return a list of corporation contacts" do
        subject.corporate_contact_list.should behave_like_rowset(
         'contactID,contactName,standing'
         ) {|c|
          case c.contact_id
            when 91005893
              c.contact_name.should == 'Cortez Klan'
              c.standing.should == 0

            when 91533484
              c.contact_name.should == 'Virgilio'
              c.standing.should == -5

            when 99001663
              c.contact_name.should == 'Lorentine'
              c.standing.should == 10
          end
        }
      end

      it "should return a list of alliance contacts" do
        subject.alliance_contact_list.should behave_like_rowset(
         'contactID,contactName,standing'
         ) {|c|
          case c.contact_id
            when 1789460651
              c.contact_name.should == 'Ogilive Collective'
              c.standing.should == 0

            when 1988009451
              c.contact_name.should == 'Araldi Alliance'
              c.standing.should == 5

            when 2002234305
              c.contact_name.should == 'Donawa'
              c.standing.should == -10
          end
        }
      end

    end

    context "with a valid character API key but no character_id" do
      it "should raise an ArgumentError" do
      proc { mock_service('character', 'contact_list', $character_api_key) }.
          should raise_error(ArgumentError)
      end
    end

    context "without an API key" do
      it "should raise an ArgumentError" do
        proc { mock_service('character', 'contact_list') }.should raise_error(ArgumentError)
      end
    end
  end
end

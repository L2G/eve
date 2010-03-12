require 'spec_helper'

# Runs the examples found in the synopsis of the README.rdoc file. We need to verify that they work because they should
# be copy-and-paste ready.

if !$mock_services  # only run these if the credentials are (theoretically) valid
  describe "Readme Examples" do
    it "should be copy-and-paste ready" do
      # Get the current server status
      api = Eve::API.new()
      server_status = api.server_status
      puts "Server reports status #{server_status.server_open ? "ONLINE" : "OFFLINE"}"
      puts "\tCurrent time is #{server_status.current_time}"
      puts "\t#{server_status.online_players} players currently online"
      puts

      # Get a list of characters
      api = Eve::API.new(:user_id => $user_id, :api_key => $limited_api_key)
      result = api.account.characters
      puts "Choose a character:"
      result.characters.each_with_index { |char, index| puts "\t#{index}: #{char.name} (#{char.character_id})" }
      choice = gets.chomp.to_i
      puts

      # Get a character sheet
      api.set(:api_key => $full_api_key, :character_id => result.characters[choice].character_id)
      character_sheet = api.character.character_sheet
      puts "#{character_sheet.name}:"
      print "\tCharisma:    \t #{character_sheet.attributes.charisma}    \n"
      print "\tIntelligence:\t #{character_sheet.attributes.intelligence}\n"
      print "\tMemory:      \t #{character_sheet.attributes.memory}      \n"
      print "\tPerception:  \t #{character_sheet.attributes.perception}  \n"
      print "\tWillpower:   \t #{character_sheet.attributes.willpower}   \n"
      puts

      # Get the current training queue
      result = api.character.skill_queue
      result.skillqueue.each do |skill|
        result.skillqueue.columns.each do |column|
          print column, ":\t\t", skill[column], "\n"
        end
        puts
      end
    end
  end
end

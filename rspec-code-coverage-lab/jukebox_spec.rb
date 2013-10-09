require 'simplecov'
SimpleCov.start
require 'json'
require 'rspec'

require_relative 'jukebox'
require_relative 'song'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end


describe Song do
  let(:song_name) { "Sweet Home Alabama" }
  let(:song) { Song.new(song_name) }

  subject { song }

  it "instantiates a Song given a single argument" do
    Song.new(song_name).should be_instance_of Song
  end

  describe "#name" do
    it { should respond_to(:name) }
    it { should respond_to(:name=) }

    its(:name) { should == song_name }
  end

end

describe Jukebox do

  before(:all) do
    @songs = [
     "The Phoenix - 1901",
     "Tokyo Police Club - Wait Up",
     "The Naked and the Famous - Young Blood",
     "(Far From) Home - Tiga",
     "The Cults - Abducted",
     "The Phoenix - Consolation Prizes"
    ]

    @list = ""
    @songs.each_with_index do |song, i|
      @list += "#{i+1} #{song}\n"
    end
  end

  let(:jukebox) { Jukebox.new(@songs) }
  let(:help) { "Please select help, list, exit, or play." }
  let(:exit) { "Goodbye, thanks for listening!" }
  let(:song) { @songs.first}
  let(:play) { "now playing #{song}" }
  let(:invalid_command) { "invalid command" }

  subject { jukebox }

  it "instantiates a Jukebox given an array of songs" do
    Jukebox.new(@songs).should be_instance_of Jukebox
  end

  describe "#on?" do
    it "returns true when the Jukebox is on" do
      jukebox.on?.should == true
    end

    it "returns false the exit command was called" do
      jukebox.exit
      jukebox.on?.should == false
    end
  end

  describe "#command" do
    describe "#exit" do
      it "calls #exit method when input is 'exit'" do
        jukebox.command('exit').should == exit      
      end
    end

    describe "#list" do
      it "calls #list method when input is 'list'" do
        jukebox.command('list').should == @list      
      end
    end

    describe "#help" do
      it "calls #help method when input is 'help'" do
        jukebox.command('help').should == help      
      end
    end

    describe "#play" do
      it "calls #play method when input is 'play'" do
        jukebox.command("play #{song}").should == play
      end
    end

    it "returns an error message for an invalid command" do
      jukebox.command("roll dice").should == invalid_command
    end
  end

end

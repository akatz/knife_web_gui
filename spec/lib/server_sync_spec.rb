require 'spec_helper'

describe ServerSync do
  subject { ServerSync.new("t","t") }
  describe '#get_servers' do
    it "should get a list of servers from aws" do
      subject.get_servers.first.should be_an_kind_of(Fog::Compute::AWS::Server)
    end
  end
  describe "#persist" do
    it "should save each server to the database" do
      expect { subject.persist }.to change{Server.count}.by(6)
    end
    it "should not create a new record if a server is already persisted" do
      subject.persist
      expect { subject.persist }.to_not change{ Server.count }
    end
    it "should update a record if it has changed" do
      subject.persist
      @staging.stop
      subject.persist
      Server.find_by_instance_id(@staging.id).state.should == "stopping"
    end
    it "should extract the name of each server from the tags" do
      subject.persist
      Server.first.name.should_not be_nil
    end
    it "should set the name to no name if there are no tags at all" do
      subject.persist
      servers = Server.all
      servers.map {|x| x.name }.should include("No Name")
      servers.reject {|x| x.name =~ /No Name/ }.size.should == 5
    end
    it "should remove any servers that don't exist on AWS anymore" do
      Server.create(instance_id: "test")
      subject.persist
      servers = Server.all
      servers.map(&:instance_id).should_not include("test")
    end
  end
end

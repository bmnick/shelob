require 'minitest/autorun'
require 'webmock/minitest'
require 'resolver'
require 'link_result'

WebMock.allow_net_connect!

describe LinkChecker::Resolver, "Link fetching module" do 
  describe "when created" do
    it "should be created with a url" do
      LinkChecker::Resolver.new("http://bmnick.com/ruby-c-extensions") 
    end
  end

  describe "when used" do
    before do
      @resolver = LinkChecker::Resolver.new("http://bmnick.com/ruby-c-extensions")
      @result = @resolver.resolve
    end

    it "should return a LinkResult" do
      @result.must_be_kind_of LinkResult
    end

    it "should return live result" do
      @result.body.must_match(/CExt/)
    end

  end
      
end

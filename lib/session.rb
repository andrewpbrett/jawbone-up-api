require 'httparty'

module Jawbone
  class Session
    attr_accessor :token
    
    include HTTParty
    
    def initialize email, password
      json = self.class.post "https://jawbone.com/user/signin/login", :query => 
        { :service => "nudge", :email => email, :pwd => password }
      @token = json["token"]
    end
    
    def feed
      puts @token
      json = self.class.get "https://jawbone.com/nudge/api/users/@me/social", :query => 
        { "after" => "null", "limit" => 100, "_token" => @token }
    end
  end
end
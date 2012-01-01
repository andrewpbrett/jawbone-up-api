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
  end
end
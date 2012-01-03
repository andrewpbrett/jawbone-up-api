require 'httparty'

module Jawbone
  
  class Session
    
    attr_accessor :token
    
    include HTTParty
    
    def self.new_from_token token
      Jawbone::Session.new nil, nil, token
    end    
    
    def initialize email, password, token = nil
      if token
        @token = token
      else
        response = self.class.post "https://jawbone.com/user/signin/login", { query:
          { service: "nudge", email: email, pwd: password } }
        @token = response["token"]        
      end
    end
    
    def feed
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/social", { query:
        { after: "null", limit: 100, _token: @token } }
      response["data"]["feed"]
    end
    
    def sleeps(feed = feed)
      feed.select { |e| e["type"] == "sleep" }
    end
    
    def full_sleeps
      local_sleeps = sleeps
      local_sleeps.each do |sleep|
        response = self.class.get "https://jawbone.com/nudge/api/sleeps/#{sleep["xid"]}/snapshot", { query: { _token: @token } }
        data = response["data"]
        sleep[:full_data] = data
      end
    end
    
    def average_time_to_sleep
      times = full_sleeps.map { |s| Sleep.new(s).time_to_sleep }
      times.inject{ |sum, el| sum + el }.to_f / times.size # times.average
    end
    
    # requires date to be in yyyy-mm-dd format
    def daily_summary date
      # assumes Pacific Time
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/healthCredits", { query:
        { _token: @token, check_levels: 1, eat_goal: 0, sleep_goal: 0, move_goal: 0,
        timezone: "-28800", date: date } }
      response["data"]
    end
    
  end
  
end
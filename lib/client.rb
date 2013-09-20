require 'httparty'

module Jawbone
  
  class Client
    
    attr_accessor :token

    API_VERSION = "1.0"
    
    include HTTParty
    
    def initialize(token)
      @token = token
    end
    
    def user
      response = self.class.get "https://jawbone.com/nudge/api/users/@me", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def friends
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/friends", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def trends
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/trends",
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def moves
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/moves", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end    

    def move(move_id)
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/moves/#{move_id}", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def move_graph(move_id)
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/moves/#{move_id}/image", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def move_intensity(move_id)
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/moves/#{move_id}/snapshot", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def workouts
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/workouts", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def workout(workout_id)
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/workouts/#{workout_id}", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def create_workout(params)
      response = self.class.post "https://jawbone.com/nudge/api/v.1.0/users/@me/workouts",
        { :headers => 
          { "Authorization" => "Bearer #{token}", 
            "Content-Type" => "application/x-www-form-urlencoded" },
          :body => params
        }
      response.parsed_response
    end

    def workout_graph(workout_id)
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/workouts/#{workout_id}/image", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def workout_intensity(workout_id)
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/workouts/#{workout_id}/snapshot", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def sleeps
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/sleeps", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def sleep(sleep_id)
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/sleeps/#{sleep_id}", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def sleep_graph(sleep_id)
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/sleeps/#{sleep_id}/image", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def sleep_intensity(sleep_id)
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/sleeps/#{sleep_id}/snapshot", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end     
    
    def meals
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/meals", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def create_meal(params)
      response = self.class.post "https://jawbone.com/nudge/api/v.1.0/users/@me/meals",
        { :headers => 
          { "Authorization" => "Bearer #{token}", 
            "Content-Type" => "application/x-www-form-urlencoded" },
          :body => params
        }
      response.parsed_response
    end

    def meal(meal_id)
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/meals/#{meal_id}", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def body_events
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/body_events", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def create_body_event(params)
      response = self.class.post "https://jawbone.com/nudge/api/v.1.0/users/@me/body_events",
        { :headers => 
          { "Authorization" => "Bearer #{token}", 
            "Content-Type" => "application/x-www-form-urlencoded" },
          :body => params
        }
      response.parsed_response
    end

    def body_event(event_id)
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/body_event/#{event_id}", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def cardiac_events
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/cardiac_events", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def create_cardiac_event(params)
      response = self.class.post "https://jawbone.com/nudge/api/v.1.0/users/@me/cardiac_events",
        { :headers => 
          { "Authorization" => "Bearer #{token}", 
            "Content-Type" => "application/x-www-form-urlencoded" },
          :body => params
        }
      response.parsed_response
    end

    def cardiac_event(event_id)
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/cardiac_event/#{event_id}", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def generic_events
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/generic_events", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def create_generic_event(params)
      response = self.class.post "https://jawbone.com/nudge/api/v.1.0/users/@me/generic_events",
        { :headers => 
          { "Authorization" => "Bearer #{token}", 
            "Content-Type" => "application/x-www-form-urlencoded" },
          :body => params
        }
      response.parsed_response
    end

    def mood
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/mood", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def create_mood(params)
      response = self.class.post "https://jawbone.com/nudge/api/v.1.0/users/@me/mood",
        { :headers => 
          { "Authorization" => "Bearer #{token}", 
            "Content-Type" => "application/x-www-form-urlencoded" },
          :body => params
        }
      response.parsed_response
    end

    def mood_event(event_id)
      response = self.class.get "https://jawbone.com/nudge/api/users/@me/mood/#{event_id}", 
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end
    
  end
  
end
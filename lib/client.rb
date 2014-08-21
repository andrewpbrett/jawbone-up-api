require 'httparty'

module Jawbone

  class Client

    attr_accessor :token

    API_VERSION = "1.0"
    BASE_URL = "https://jawbone.com/nudge/api/v.1.0"

    include HTTParty

    def initialize(token)
      @token = token
    end

    def user
      get_helper("users/@me", {})
    end
  
    def goals
      get_helper("users/@me/goals", {})
    end

    def friends
      get_helper("users/@me/friends", {})
    end

    def trends(params={})
      get_helper("users/@me/trends", params)
    end

    def bandevents(params={})
      get_helper("users/@me/bandevents", params)
    end

    def disconnect
      delete_helper("users/@me/PartnerAppMembership")
    end

    def refresh_token(client_secret)
      post_helper("users/@me/refreshToken", {secret: client_secret})
    end

    base_strings = ["move", "body_event", "workout", "sleep", "meal",
      "cardiac_event", "generic_event"]

    base_strings.each do |base|
      plural = base + "s"

      define_method plural do |*args|
        get_helper("users/@me/#{plural}", args.first || {})
      end

      define_method base do |id|
        get_helper("#{plural}/#{id}", {})
      end

      define_method "#{base}_graph" do |id|
        get_helper("#{plural}/#{id}/image", {})
      end

      define_method "#{base}_intensity" do |id|
        get_helper("#{plural}/#{id}/snapshot", {})
      end

      define_method "create_#{base}" do |params|
        post_plural = base == "mood" ? base : plural
        post_helper("users/@me/#{post_plural}", params)
      end
    end

    define_method "moods" do |*args|
      get_helper("users/@me/mood", args.first || {})
    end

    define_method "mood" do |id|
      get_helper("mood/#{id}", {})
    end

    private

    def post_helper(path, params)
      path = "/" + path unless path[0] == '/'
      url = BASE_URL + path
      response = self.class.post url,
        { :headers =>
          { "Authorization" => "Bearer #{token}",
            "Content-Type" => "application/x-www-form-urlencoded" },
          :body => params
        }
      response.parsed_response
    end

    def delete_helper(path)
      path = "/" + path unless path[0] == '/'
      url = BASE_URL + path
      response = self.class.delete url,
        { :headers =>
          { "Authorization" => "Bearer #{token}" }
        }
      response.parsed_response
    end

    def get_helper(path, params={})
      path = "/" + path unless path[0] == '/'
      url = BASE_URL + path
      stringified_params = params.collect do |k, v|
        "#{k}=#{v}"
      end.sort * '&'
      full_url = url + "?" + stringified_params
      response = self.class.get full_url,
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

  end

end

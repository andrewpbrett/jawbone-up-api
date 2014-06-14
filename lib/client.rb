require 'httparty'

module Jawbone

  class Client

    attr_accessor :token

    API_VERSION = "1.0"
    PROTOCOL_AND_HOST = "https://jawbone.com"
    BASE_URL = "#{PROTOCOL_AND_HOST}/nudge/api/v.1.0"

    include HTTParty

    def initialize(token)
      @token = token
    end

    def user
      get_helper("users/@me", {})
    end

    def friends
      get_helper("users/@me/friends", {})
    end

    def trends(params={})
      get_helper("users/@me/trends", params)
    end

    def disconnect
      delete_helper("users/@me/PartnerAppMembership")
    end

    def refresh_token(client_secret)
      post_helper("users/@me/refreshToken", {secret: client_secret})
    end

    # the basic functions such as sleeps() give you only the first
    # page of results.  this function will repeatedly make calls to
    # the Jawbone API for you as necessary, returning all the items on
    # all the pages.
    #
    # the batch argument must be the result of calling one of the
    # basic functions.
    #
    def retrieve_all_items(batch)
      unless batch.is_a?(Hash) && batch.has_key?("data") && batch["data"].is_a?(Hash) && batch["data"].has_key?("items")
        raise "jawbone_up_api retrieve_all_items() was given a bad batch: #{batch}"
      end

      items = batch["data"]["items"]
      while batch["data"].has_key?("links") do
        unless batch["data"]["links"].has_key?("next")
          raise "jawbone_up_api retrieve_all_items() has links but no next: #{batch}"
        end
        batch = get_path(batch["data"]["links"]["next"])
        items += batch["data"]["items"]
      end

      items
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
      get_header_helper(full_url)
    end

    def get_header_helper(full_url)
      response = self.class.get full_url,
        { :headers => { "Authorization" => "Bearer #{token}" } }
      response.parsed_response
    end

    def get_path(path)
      full_url = "#{PROTOCOL_AND_HOST}/#{path}"
      get_header_helper(full_url)
    end
  end

end

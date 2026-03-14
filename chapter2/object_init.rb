# frozen_string_literal: true

module Twitter
  module REST
    class Client
      attr_accessor :consumer_key, :consumer_secret,
                    :access_token, :access_token_secret

      def initialize
        yield self if block_given?
      end
    end
  end
end

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'customer_key'
  config.consumer_secret     = 'customer_secret'
  config.access_token        = 'access_token'
  config.access_token_secret = 'access_secret'
end

p client.consumer_key

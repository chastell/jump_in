require 'base64'

module LetMeIn
  module Tokenizer
    DELIMITER = '.'.freeze

    def self.generate_token
      Base64.encode64 [SecureRandom.hex(12), Time.now.xmlschema].join(DELIMITER)
    end

    def self.decode_token(token)
      Base64.decode64(token).split(DELIMITER)
    end

    def self.decode_time(token)
      token_time = decode_token(token)[1]
      Time.parse(token_time)
    end
  end
end


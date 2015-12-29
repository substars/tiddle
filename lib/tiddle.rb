require "tiddle/version"
fail "tiddle #{Tiddle::VERSION} does not support MRI 1.9." if RUBY_PLATFORM != 'java' && RUBY_VERSION < '2.0.0'
require "tiddle/model"
require "tiddle/strategy"
require "tiddle/rails"
require "tiddle/token_issuer"

module Tiddle

  def self.create_and_return_token(resource, request)
    TokenIssuer.build.create_and_return_token(resource, request)
  end

  def self.expire_token(resource, request)
    TokenIssuer.build.expire_token(resource, request)
  end

  def self.purge_old_tokens(resource)
    TokenIssuer.build.purge_old_tokens(resource)
  end
end

Devise.add_module :token_authenticatable,
                  model: 'tiddle/model',
                  strategy: true,
                  no_input: true

require 'rest-client'
require 'json'

require_relative 'http'

module Synconfig

  class Param

    attr_accessor :namespace
    attr_accessor :key
    attr_accessor :value

    def initialize(n, k, v={})
      self.namespace = "#{n}"
      self.key = "#{k}"
      self.value = v
    end

    def to_json
      p = { namespace: @namespace, key: @key }
      p.merge!({value: @value}) unless value.empty?
      p.to_json
    end
  end

  class Api < Http
    attr_reader :server_url
    attr_reader :token

    def initialize(server_url, token)
      super()
      uri = URI.parse(server_url)
      @server_url = sprintf("%s://%s:%d", uri.scheme, uri.hostname, uri.port)
      @token = token
    end

    def headers
      {token: @token, content_type: :json, accept: :json}
    end

    def get(namespace, key)
      url = @server_url + '/key'
      param = Param.new(namespace, key)
      resp = super(url, param.to_json, headers)
      resp
    end

    def set(namespace, key, value)
      url = @server_url + "/key"
      param = Param.new namespace, key, value
      resp = self.post(url, param.to_json, headers)
      resp
    end

    def del(namespace, key )
      url = @server_url + "/key"
      param = Param.new namespace, key
      resp = self.delete(url, param.to_json, headers)
      resp
    end

  end
end

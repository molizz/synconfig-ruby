class Http

  attr_reader :options

  protected

  def get(url, body, headers = {}, &block)
    http_client(:get, url, body, headers, &block)
  end

  def post(url, body, headers = {}, &block)
    http_client(:post, url, body, headers, &block)
  end

  private

  def http_client(method, url, payload, headers = {}, &block)
    options = { open_timeout: 10, verify_ssl: false }

    RestClient::Request.execute(options.merge(
        :method => method,
        :url => url,
        :payload => payload,
        :headers => headers), &block)
  end
end
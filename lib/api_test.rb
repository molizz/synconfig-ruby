require_relative 'api'
require "test/unit"
require "json"


class TestApi < Test::Unit::TestCase

  NAMESPACE = "ruby_test"
  KEY = "ruby"
  VALUE = {ruby: "is-shit"}

  URL = "https://127.0.0.1:6020"
  TOKEN = "hello"

  def test_api
    api =  Synconfig::Api.new(URL, TOKEN)

    resp = api.post NAMESPACE, KEY, VALUE.to_json

    assert_equal 200, resp.code, "提交的数据返回值不正确：%d" % resp.code

    resp =  api.get NAMESPACE, KEY

    assert_equal 200, resp.code, "获取数据的返回值不正确：%d" % resp.code


    resp_body = JSON.parse(resp.body)
    assert_equal true, resp_body.include?("data"), "返回值错误：%s" % resp.body
  end

end

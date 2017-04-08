require 'test_helper'

class PolindromControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get '/'
    assert_response :success
  end

  test "should get output" do
    get '/output'
    assert_response :success
  end

  test "should get 4" do
    get '/output', n: 5
    assert_equal assigns[:num], 4
  end

  test "should get 0 if negative" do
    get '/output', n: -5
    assert_equal assigns[:num], 0
  end

  test "should get 0 if letter" do
    get '/output', n: 'a'
    assert_equal assigns[:num], 0
  end

  test "should get html" do
    get '/output', {n: 9000}
    assert_equal response.content_type, "text/html"
  end

  test "should get xml" do
    get '/output', {n: 9000, format: 'xml'}
    assert_equal response.content_type, "application/xml"
  end
end

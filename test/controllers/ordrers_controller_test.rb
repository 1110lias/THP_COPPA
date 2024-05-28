require "test_helper"

class OrdrersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ordrer = ordrers(:one)
  end

  test "should get index" do
    get ordrers_url
    assert_response :success
  end

  test "should get new" do
    get new_ordrer_url
    assert_response :success
  end

  test "should create ordrer" do
    assert_difference("Ordrer.count") do
      post ordrers_url, params: { ordrer: {  } }
    end

    assert_redirected_to ordrer_url(Ordrer.last)
  end

  test "should show ordrer" do
    get ordrer_url(@ordrer)
    assert_response :success
  end

  test "should get edit" do
    get edit_ordrer_url(@ordrer)
    assert_response :success
  end

  test "should update ordrer" do
    patch ordrer_url(@ordrer), params: { ordrer: {  } }
    assert_redirected_to ordrer_url(@ordrer)
  end

  test "should destroy ordrer" do
    assert_difference("Ordrer.count", -1) do
      delete ordrer_url(@ordrer)
    end

    assert_redirected_to ordrers_url
  end
end

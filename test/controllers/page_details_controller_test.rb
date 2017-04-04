require 'test_helper'

class PageDetailsControllerTest < ActionController::TestCase
  setup do
    @page_detail = page_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_details)
    assert_equal Mime::JSON, response.content_type
  end

  test "should create page_detail" do
    assert_difference('PageDetail.count') do
      post :create, { url: "http://localhost:3000/temp.html" }
    end
    assert_equal Mime::JSON, response.content_type
    assert_response 201
  end

  test "should show page_detail" do
    get :show, id: @page_detail
    assert_response :success
  end

  test "should update page_detail" do
    put :update, id: @page_detail, page_detail: { h1_tags: @page_detail.h1_tags, h2_tags: @page_detail.h2_tags, h3_tags: @page_detail.h3_tags, url: @page_detail.url }
    assert_response 204
  end

  test "should destroy page_detail" do
    assert_difference('PageDetail.count', -1) do
      delete :destroy, id: @page_detail
    end

    assert_response 204
  end
end

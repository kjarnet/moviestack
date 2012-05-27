require 'test_helper'

class Video::SeriesControllerTest < ActionController::TestCase
  setup do
    @video_series = video_series(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:video_series)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video_series" do
    assert_difference('Video::Series.count') do
      post :create, video_series: @video_series.attributes
    end

    assert_redirected_to video_series_path(assigns(:video_series))
  end

  test "should show video_series" do
    get :show, id: @video_series
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @video_series
    assert_response :success
  end

  test "should update video_series" do
    put :update, id: @video_series, video_series: @video_series.attributes
    assert_redirected_to video_series_path(assigns(:video_series))
  end

  test "should destroy video_series" do
    assert_difference('Video::Series.count', -1) do
      delete :destroy, id: @video_series
    end

    assert_redirected_to video_series_index_path
  end
end

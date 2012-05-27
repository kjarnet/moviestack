require 'test_helper'

class Video::MoviesControllerTest < ActionController::TestCase
  setup do
    @video_movie = video_movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:video_movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video_movie" do
    assert_difference('Video::Movie.count') do
      post :create, video_movie: @video_movie.attributes
    end

    assert_redirected_to video_movie_path(assigns(:video_movie))
  end

  test "should show video_movie" do
    get :show, id: @video_movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @video_movie
    assert_response :success
  end

  test "should update video_movie" do
    put :update, id: @video_movie, video_movie: @video_movie.attributes
    assert_redirected_to video_movie_path(assigns(:video_movie))
  end

  test "should destroy video_movie" do
    assert_difference('Video::Movie.count', -1) do
      delete :destroy, id: @video_movie
    end

    assert_redirected_to video_movies_path
  end
end

class Video::MoviesController < ApplicationController
  # GET /video/movies
  # GET /video/movies.json
  def index
    @video_movies = Video::Movie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @video_movies }
    end
  end

  # GET /video/movies/1
  # GET /video/movies/1.json
  def show
    @video_movie = Video::Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video_movie }
    end
  end

  # GET /video/movies/new
  # GET /video/movies/new.json
  def new
    @video_movie = Video::Movie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video_movie }
    end
  end

  # GET /video/movies/1/edit
  def edit
    @video_movie = Video::Movie.find(params[:id])
  end

  # POST /video/movies
  # POST /video/movies.json
  def create
    @video_movie = Video::Movie.new(params[:video_movie])

    respond_to do |format|
      if @video_movie.save
        format.html { redirect_to @video_movie, notice: 'Movie was successfully created.' }
        format.json { render json: @video_movie, status: :created, location: @video_movie }
      else
        format.html { render action: "new" }
        format.json { render json: @video_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /video/movies/1
  # PUT /video/movies/1.json
  def update
    @video_movie = Video::Movie.find(params[:id])

    respond_to do |format|
      if @video_movie.update_attributes(params[:video_movie])
        format.html { redirect_to @video_movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video/movies/1
  # DELETE /video/movies/1.json
  def destroy
    @video_movie = Video::Movie.find(params[:id])
    @video_movie.destroy

    respond_to do |format|
      format.html { redirect_to video_movies_url }
      format.json { head :no_content }
    end
  end
end

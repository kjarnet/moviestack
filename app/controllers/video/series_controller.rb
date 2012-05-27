class Video::SeriesController < ApplicationController
  # GET /video/series
  # GET /video/series.json
  def index
    @video_series = Video::Series.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @video_series }
    end
  end

  # GET /video/series/1
  # GET /video/series/1.json
  def show
    @video_series = Video::Series.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video_series }
    end
  end

  # GET /video/series/new
  # GET /video/series/new.json
  def new
    @video_series = Video::Series.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video_series }
    end
  end

  # GET /video/series/1/edit
  def edit
    @video_series = Video::Series.find(params[:id])
  end

  # POST /video/series
  # POST /video/series.json
  def create
    @video_series = Video::Series.new(params[:video_series])

    respond_to do |format|
      if @video_series.save
        format.html { redirect_to @video_series, notice: 'Series was successfully created.' }
        format.json { render json: @video_series, status: :created, location: @video_series }
      else
        format.html { render action: "new" }
        format.json { render json: @video_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /video/series/1
  # PUT /video/series/1.json
  def update
    @video_series = Video::Series.find(params[:id])

    respond_to do |format|
      if @video_series.update_attributes(params[:video_series])
        format.html { redirect_to @video_series, notice: 'Series was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video/series/1
  # DELETE /video/series/1.json
  def destroy
    @video_series = Video::Series.find(params[:id])
    @video_series.destroy

    respond_to do |format|
      format.html { redirect_to video_series_index_url }
      format.json { head :no_content }
    end
  end
end

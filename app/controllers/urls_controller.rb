class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :update, :destroy]

  # GET /urls
  def index
    @urls = Url.all

    render json: @urls
  end

  # GET /urls/1
  def show
    render json: @url
  end

  # POST /urls
  def create
    @url = Url.new(url_params)
    set_begin_path
    if @url.create
      render json: @url, status: :created, location: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /urls/1
  def update
    set_begin_path
    if @url.update
      render json: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # DELETE /urls/1
  def destroy
    @url.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def url_params
      params.require(:url).permit(:path)
    end

    def set_begin_path
      unless @url.path.downcase.start_with?('http://','https://')
        @url.path = @url.path.prepend('http://')
      end
      if @url.path.downcase.start_with?('https://')
        @url.path = @url.path.gsub('https://','http://')
      end
    end
end

class PageDetailsController < ApplicationController
  before_action :set_page_detail, only: [:show, :update, :destroy]

  # GET /page_details
  # GET /page_details.json
  def index
    @page_details = PageDetail.all

    render json: @page_details
  end

  # GET /page_details/1
  # GET /page_details/1.json
  def show
    render json: @page_detail
  end

  # POST /page_details
  # POST /page_details.json
  def create
    @page_detail = PageDetail.new(page_detail_params)
    # @page_detail.index_url(params[])
    if @page_detail.save
      render json: @page_detail, status: :created, location: @page_detail
    else
      render json: @page_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /page_details/1
  # PATCH/PUT /page_details/1.json
  def update
    if @page_detail.update(page_detail_params)
      head :no_content
    else
      render json: @page_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /page_details/1
  # DELETE /page_details/1.json
  def destroy
    @page_detail.destroy

    head :no_content
  end

  private

    def set_page_detail
      @page_detail = PageDetail.find(params[:id])
    end

    def page_detail_params
      params.permit(:url)
      # params.require(:page_detail).permit(:url)
    end
end

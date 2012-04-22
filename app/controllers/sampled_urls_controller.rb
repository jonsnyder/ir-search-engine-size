class SampledUrlsController < ApplicationController
  # GET /sampled_urls
  # GET /sampled_urls.json
  def index
    @sampled_urls = SampledUrl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sampled_urls }
    end
  end

  # GET /sampled_urls/1
  # GET /sampled_urls/1.json
  def show
    @sampled_url = SampledUrl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sampled_url }
    end
  end

  # GET /sampled_urls/new
  # GET /sampled_urls/new.json
  def new
    @sampled_url = SampledUrl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sampled_url }
    end
  end

  # GET /sampled_urls/1/edit
  def edit
    @sampled_url = SampledUrl.find(params[:id])
  end

  # POST /sampled_urls
  # POST /sampled_urls.json
  def create
    @sampled_url = SampledUrl.new(params[:sampled_url])

    respond_to do |format|
      if @sampled_url.save
        format.html { redirect_to @sampled_url, notice: 'Sampled url was successfully created.' }
        format.json { render json: @sampled_url, status: :created, location: @sampled_url }
      else
        format.html { render action: "new" }
        format.json { render json: @sampled_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sampled_urls/1
  # PUT /sampled_urls/1.json
  def update
    @sampled_url = SampledUrl.find(params[:id])

    respond_to do |format|
      if @sampled_url.update_attributes(params[:sampled_url])
        format.html { redirect_to @sampled_url, notice: 'Sampled url was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sampled_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sampled_urls/1
  # DELETE /sampled_urls/1.json
  def destroy
    @sampled_url = SampledUrl.find(params[:id])
    @sampled_url.destroy

    respond_to do |format|
      format.html { redirect_to sampled_urls_url }
      format.json { head :no_content }
    end
  end
end

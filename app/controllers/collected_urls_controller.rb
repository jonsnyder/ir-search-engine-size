class CollectedUrlsController < ApplicationController
  # GET /collected_urls
  # GET /collected_urls.json
  def index
    @collected_urls = CollectedUrl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collected_urls }
    end
  end

  # GET /collected_urls/1
  # GET /collected_urls/1.json
  def show
    @collected_url = CollectedUrl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @collected_url }
    end
  end

  # GET /collected_urls/new
  # GET /collected_urls/new.json
  def new
    @collected_url = CollectedUrl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collected_url }
    end
  end

  # GET /collected_urls/1/edit
  def edit
    @collected_url = CollectedUrl.find(params[:id])
  end

  # POST /collected_urls
  # POST /collected_urls.json
  def create
    @collected_url = CollectedUrl.new(params[:collected_url])

    respond_to do |format|
      if @collected_url.save
        format.html { redirect_to @collected_url, notice: 'Collected url was successfully created.' }
        format.json { render json: @collected_url, status: :created, location: @collected_url }
      else
        format.html { render action: "new" }
        format.json { render json: @collected_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /collected_urls/1
  # PUT /collected_urls/1.json
  def update
    @collected_url = CollectedUrl.find(params[:id])

    respond_to do |format|
      if @collected_url.update_attributes(params[:collected_url])
        format.html { redirect_to @collected_url, notice: 'Collected url was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @collected_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collected_urls/1
  # DELETE /collected_urls/1.json
  def destroy
    @collected_url = CollectedUrl.find(params[:id])
    @collected_url.destroy

    respond_to do |format|
      format.html { redirect_to collected_urls_url }
      format.json { head :no_content }
    end
  end
end
